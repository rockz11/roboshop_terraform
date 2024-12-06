terraform {
  backend "s3" {
    #bucket = "terraform143"
    #key    = "sample/terraform.tfstate"
    #region = "us-east-1"
  }
}
# The above bucket,key,region, are to be parameterized
# This means that making this state file flexible to different data