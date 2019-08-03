provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = "mstakx-level1-248515"
  region      = "europe-west3"
}
