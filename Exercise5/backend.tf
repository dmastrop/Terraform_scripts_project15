terraform {
    backend "s3" {
        bucket = "terraform-state-project15"
        key = "terraformstate/backend"
        region = "us-east-1"
    }
}