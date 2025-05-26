terraform {
  backend "s3" {
    bucket       = "new-use-cases"
    key          = "terraform/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}