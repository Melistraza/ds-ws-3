resource "digitalocean_ssh_key" "terraform" {
  name       = "Terraform"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

# Create a new production droplet
resource "digitalocean_droplet" "production" {
  image  = "${var.digitalocean_image}"
  name   = "${var.production_domain}"
  region = "${var.digitalocean_region}"
  size   = "512mb"
  ssh_keys = ["${digitalocean_ssh_key.terraform.id}"]
}

# Create a new staging droplet
resource "digitalocean_droplet" "staging" {
  image  = "${var.digitalocean_image}"
  name   = "${var.staging_domain}"
  region = "${var.digitalocean_region}"
  size   = "512mb"
  ssh_keys = ["${digitalocean_ssh_key.terraform.id}"]
}

# Create a new development droplet
resource "digitalocean_droplet" "dev" {
  image  = "${var.digitalocean_image}"
    name   = "${var.development_domain}"
  region = "${var.digitalocean_region}"
  size   = "512mb"
  ssh_keys = ["${digitalocean_ssh_key.terraform.id}"]
}

# Create a new jenkins droplet
resource "digitalocean_droplet" "jenkins" {
  image  = "${var.digitalocean_image}"
  name   = "${var.jenkins_domain}"
  region = "${var.digitalocean_region}"
  size   = "2gb"
  ssh_keys = ["${digitalocean_ssh_key.terraform.id}"]
}

# Create a new elk droplet
resource "digitalocean_droplet" "elk" {
  image  = "${var.digitalocean_image}"
  name   = "${var.kibana_domain}"
  region = "${var.digitalocean_region}"
  size   = "2gb"
  ssh_keys = ["${digitalocean_ssh_key.terraform.id}"]
}

# Create a new nagios droplet
resource "digitalocean_droplet" "nagios" {
  image  = "${var.digitalocean_image}"
  name   = "${var.nagios_domain}"
  region = "${var.digitalocean_region}"
  size   = "512mb"
  ssh_keys = ["${digitalocean_ssh_key.terraform.id}"]
}
