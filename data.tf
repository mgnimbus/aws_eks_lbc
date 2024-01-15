data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../eks_module/terraform.tfstate"
  }
}

data "aws_eks_cluster" "eks" {
  name = data.terraform_remote_state.eks.outputs.cluster_id

}
data "aws_eks_cluster_auth" "eks_auth" {
  name = data.terraform_remote_state.eks.outputs.cluster_id
}

data "http" "lbc_iam_policy" {
  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}
