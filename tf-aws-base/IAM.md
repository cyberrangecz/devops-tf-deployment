{
    "Version": "2012-10-17",
    "Statement": [
        {
          "Effect": "Allow",
          "Action": [
            "elasticfilesystem:CreateAccessPoint",
            "elasticfilesystem:DeleteAccessPoint",
            "elasticfilesystem:DescribeAccessPoints",
            "elasticfilesystem:DescribeFileSystems",
            "elasticfilesystem:DescribeMountTargets",
            "elasticfilesystem:ListTagsForResource",
            "elasticfilesystem:TagResource",
            "elasticfilesystem:UntagResource"
          ],
          "Resource": [
            "arn:aws:elasticfilesystem:eu-central-1:*:file-system/*",
            "arn:aws:elasticfilesystem:eu-central-1:*:access-point/*"
          ]
        },
        {
            "Sid": "EFSPermissions",
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:CreateFileSystem",
                "elasticfilesystem:DeleteFileSystem",
                "elasticfilesystem:DescribeFileSystems",
                "elasticfilesystem:TagResource",
                "elasticfilesystem:DescribeLifecycleConfiguration",
                "elasticfilesystem:PutLifecycleConfiguration",
                "elasticfilesystem:CreateMountTarget",
                "elasticfilesystem:DeleteMountTarget",
                "elasticfilesystem:DescribeMountTargets",
                "elasticfilesystem:DescribeMountTargetSecurityGroups"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "eu-central-1"
                }
            }
        },
        {
            "Sid": "CloudWatchMetrics",
            "Effect": "Allow",
            "Action": "cloudwatch:GetMetricStatistics",
            "Resource": "*"
        },
        {
            "Sid": "ServiceQuotas",
            "Effect": "Allow",
            "Action": "servicequotas:GetServiceQuota",
            "Resource": "*"
        },
        {
            "Sid": "ManageIAMOIDCProviders",
            "Effect": "Allow",
            "Action": [
                "iam:CreateOpenIDConnectProvider",
                "iam:GetOpenIDConnectProvider",
                "iam:UpdateOpenIDConnectProviderThumbprint",
                "iam:DeleteOpenIDConnectProvider",
                "iam:ListOpenIDConnectProviders"
            ],
            "Resource": "arn:aws:iam::*:oidc-provider/oidc.eks.eu-central-1.amazonaws.com/id/*"
        },
        {
            "Sid": "ManageServiceLinkedRoles",
            "Effect": "Allow",
            "Action": [
                "iam:CreateServiceLinkedRole",
                "iam:DeleteServiceLinkedRole",
                "iam:GetServiceLinkedRoleDeletionStatus",
                "iam:GetRole",
                "iam:GetPolicy",
                "iam:GetPolicyVersion",
                "iam:CreatePolicy",
                "iam:DeletePolicy",
                "iam:ListPolicyVersions",
                "iam:ListPolicies"
            ],
            "Resource": "*"
        },
        {
            "Sid": "ManageSpecificIAMRolesAndPolicies",
            "Effect": "Allow",
            "Action": [
                "iam:CreateRole",
                "iam:DeleteRole",
                "iam:GetRole",
                "iam:UpdateRole",
                "iam:UpdateAssumeRolePolicy",
                "iam:PassRole",
                "iam:AttachRolePolicy",
                "iam:DetachRolePolicy",
                "iam:ListRolePolicies",
                "iam:GetRolePolicy",
                "iam:PutRolePolicy",
                "iam:DeleteRolePolicy",
                "iam:ListAttachedRolePolicies",
                "iam:TagRole",
                "iam:UntagRole",
                "iam:ListInstanceProfiles",
                "iam:GetInstanceProfile",
                "iam:CreateInstanceProfile",
                "iam:AddRoleToInstanceProfile",
                "iam:RemoveRoleFromInstanceProfile",
                "iam:DeleteInstanceProfile",
                "iam:ListInstanceProfilesForRole",
                "iam:ListRoles"
            ],
            "Resource": [
                "arn:aws:iam::*:role/eks-cluster",
                "arn:aws:iam::*:role/eks-workers",
                "arn:aws:iam::*:instance-profile/*",
                "arn:aws:iam::*:role/AmazonEKS_EFS_CSI_DriverRole",
                "arn:aws:iam::*:role/AmazonEKS_EBS_CSI_DriverRole"
            ]
        },
        {
            "Sid": "AttachDetachSpecificPolicies",
            "Effect": "Allow",
            "Action": [
                "iam:AttachRolePolicy",
                "iam:DetachRolePolicy"
            ],
            "Resource": [
                "arn:aws:iam::*:role/eks-cluster",
                "arn:aws:iam::*:role/eks-workers"
            ],
            "Condition": {
                "ArnEquals": {
                    "iam:PolicyARN": [
                        "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
                        "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
                        "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
                        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
                    ]
                }
            }
        },
        {
            "Sid": "ManageEKSCluster",
            "Effect": "Allow",
            "Action": [
                "eks:CreateCluster",
                "eks:DeleteCluster",
                "eks:DescribeCluster",
                "eks:UpdateClusterConfig",
                "eks:TagResource",
                "eks:UntagResource"
            ],
            "Resource": "arn:aws:eks:eu-central-1:*:cluster/*"
        },
        {
            "Sid": "ManageEKSNodeGroup",
            "Effect": "Allow",
            "Action": [
                "eks:CreateNodegroup",
                "eks:DeleteNodegroup",
                "eks:DescribeNodegroup",
                "eks:UpdateNodegroupConfig"
            ],
            "Resource": [
                "arn:aws:eks:eu-central-1:*:nodegroup/*/*/*",
                "arn:aws:eks:eu-central-1:*:cluster/*"
            ]
        },
        {
            "Sid": "ListEKSResources",
            "Effect": "Allow",
            "Action": [
                "eks:ListClusters",
                "eks:ListNodegroups",
                "eks:ListUpdates",
                "eks:DescribeUpdate"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "eu-central-1"
                }
            }
        },
        {
            "Sid": "ManageELB",
            "Effect": "Allow",
            "Action": [
                "elasticloadbalancing:CreateLoadBalancer",
                "elasticloadbalancing:DeleteLoadBalancer",
                "elasticloadbalancing:DescribeLoadBalancers",
                "elasticloadbalancing:RegisterTargets",
                "elasticloadbalancing:DeregisterTargets",
                "elasticloadbalancing:CreateTargetGroup",
                "elasticloadbalancing:DeleteTargetGroup",
                "elasticloadbalancing:DescribeTargetGroups",
                "elasticloadbalancing:ModifyTargetGroup",
                "elasticloadbalancing:SetSecurityGroups",
                "elasticloadbalancing:ModifyLoadBalancerAttributes",
                "elasticloadbalancing:AddTags",
                "elasticloadbalancing:RemoveTags"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "eu-central-1"
                }
            }
        },
        {
            "Sid": "ManageTLSCertificates",
            "Effect": "Allow",
            "Action": [
                "acm:RequestCertificate",
                "acm:DeleteCertificate",
                "acm:DescribeCertificate",
                "acm:GetCertificate",
                "acm:ListCertificates"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "eu-central-1"
                }
            }
        }
    ]
}
