provider "google" {
 credentials = file(".gcp_credential.json")
 project     = "plated-cabinet-304220"
 region      = "us-west1"
}