
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "EC2ReadActions",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:DescribeInstanceStatus",
                "ec2:DescribeInstanceTypes",
                "ec2:DescribeInstanceAttribute",
                "ec2:DescribeInstanceCreditSpecifications",
                "ec2:DescribeSpotInstanceRequests",
                "ec2:DescribeImages",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcs",
                "ec2:DescribeKeyPairs",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeRouteTables",
                "ec2:DescribeAvailabilityZones",
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeVpcAttribute",
                "ec2:DescribeSecurityGroupRules",
                "ec2:DescribeNatGateways",
                "ec2:DescribeInternetGateways",
                "ec2:DescribeAddresses",
                "ec2:DescribeVolumes",
                "ec2:DescribeTags"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "eu-central-1"
                }
            }
        },
        {
            "Sid": "ManageEC2Resources",
            "Effect": "Allow",
            "Action": [
                "ec2:RunInstances",
                "ec2:TerminateInstances",
                "ec2:ModifyNetworkInterfaceAttribute",
                "ec2:AttachNetworkInterface",
                "ec2:CreateNetworkInterface",
                "ec2:DeleteNetworkInterface",
                "ec2:DetachNetworkInterface",
                "ec2:ImportKeyPair",
                "ec2:DeleteKeyPair",
                "ec2:AllocateAddress",
                "ec2:ReleaseAddress",
                "ec2:DisassociateAddress",
                "ec2:CreateNatGateway",
                "ec2:DeleteNatGateway",
                "ec2:CreateVpc",
                "ec2:DeleteVpc",
                "ec2:AssociateVpcCidrBlock",
                "ec2:DisassociateVpcCidrBlock",
                "ec2:CreateSubnet",
                "ec2:DeleteSubnet",
                "ec2:ModifySubnetAttribute",
                "ec2:CreateInternetGateway",
                "ec2:DeleteInternetGateway",
                "ec2:AttachInternetGateway",
                "ec2:DetachInternetGateway",
                "ec2:CreateRouteTable",
                "ec2:DeleteRouteTable",
                "ec2:AssociateRouteTable",
                "ec2:DisassociateRouteTable",
                "ec2:CreateRoute",
                "ec2:DeleteRoute",
                "ec2:CreateSecurityGroup",
                "ec2:DeleteSecurityGroup",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:CreateTags",
                "ec2:DeleteTags",
                "ec2:ModifyVpcAttribute",
                "ec2:CreateVolume",
                "ec2:AttachVolume",
                "ec2:DeleteVolume",
                "ec2:CancelSpotInstanceRequests"
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
