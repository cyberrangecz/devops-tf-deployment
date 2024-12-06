resource "aws_efs_file_system" "efs" {
  creation_token = "crczp-efs"
  encrypted      = true
  tags = {
    Name = "crczp-efs"
  }
}

resource "aws_efs_access_point" "root" {
  file_system_id = aws_efs_file_system.efs.id

  posix_user {
    uid = 0
    gid = 0
  }

  root_directory {
    path = "/app-data"
    creation_info {
      owner_uid   = 0
      owner_gid   = 0
      permissions = "0777"
    }
  }

  tags = {
    Name = "Root Access Point"
  }
}

resource "aws_security_group" "efs_sg" {
  name        = "efs-security-group"
  description = "Security group for EFS"
  vpc_id      = data.terraform_remote_state.aws_base.outputs.vpc_id

  ingress {
    from_port = 2049
    to_port   = 2049
    protocol  = "tcp"
    security_groups = [
      data.terraform_remote_state.aws_base.outputs.eks_node_group_security_group
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EFS Security Group"
  }
}

resource "aws_efs_mount_target" "efs_mount" {
  count          = length(data.terraform_remote_state.aws_base.outputs.eks_node_group_subnet_ids)
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = data.terraform_remote_state.aws_base.outputs.eks_node_group_subnet_ids[count.index]
  security_groups = [
    aws_security_group.efs_sg.id,
  ]
}

resource "aws_iam_role" "efs_csi_driver_role" {
  name = "AmazonEKS_EFS_CSI_DriverRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = "arn:aws:iam::${var.account_id}:oidc-provider/${replace(data.aws_eks_cluster.eks.identity[0].oidc[0].issuer, "https://", "")}"
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringEquals = {
            "${replace(data.aws_eks_cluster.eks.identity[0].oidc[0].issuer, "https://", "")}:sub" : "system:serviceaccount:kube-system:efs-csi-controller-sa"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "efs_csi_driver_policy_attachment" {
  role       = aws_iam_role.efs_csi_driver_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"
}

resource "kubernetes_service_account" "efs_csi_driver_sa" {
  metadata {
    name      = "efs-csi-controller-sa"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.efs_csi_driver_role.arn
    }
  }
}

resource "helm_release" "aws_efs_csi_driver" {
  name       = "aws-efs-csi-driver"
  namespace  = "kube-system"
  repository = "https://kubernetes-sigs.github.io/aws-efs-csi-driver"
  chart      = "aws-efs-csi-driver"
  version    = "3.0.8"

  set {
    name  = "controller.serviceAccount.create"
    value = "false"
  }

  set {
    name  = "controller.serviceAccount.name"
    value = kubernetes_service_account.efs_csi_driver_sa.metadata[0].name
  }

  set {
    name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.efs_csi_driver_role.arn
  }
}

resource "kubernetes_storage_class" "root_efs_sc" {
  metadata {
    name = "root-efs-sc"
  }

  storage_provisioner = "efs.csi.aws.com"
  reclaim_policy      = "Retain"
  volume_binding_mode = "Immediate"

  parameters = {
    provisioningMode = "efs-ap"
    uid              = 0
    gid              = 0
    fileSystemId     = aws_efs_file_system.efs.id
    accessPointId    = aws_efs_access_point.root.id
    directoryPerms   = "0777"
  }
}
