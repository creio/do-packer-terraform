# Packer Terraform DigitalOcean

- A DigitalOcean [API key](https://www.digitalocean.com/docs/api/create-personal-access-token/)
- Packer [installed](https://www.packer.io/intro/getting-started/install.html)
- Terraform [installed](https://learn.hashicorp.com/terraform/getting-started/install.html)

Instal Arch.

```bash
sudo pacman -S packer terraform
```

Add API key `packer/template.json`, `terraform/terraform.tfvars`.

Validate template files.

```bash
cd packer
packer validate template.json
```

Build image.

```bash
packer build template.json
```

Initialize Terraform.

```bash
terraform init
```

Preview.

```bash
terraform plan
```

Deploy the image to a Droplets.

```bash
terraform apply
#
terraform apply -auto-approve
```

Destroy/del Droplets.

```bash
terraform destroy -auto-approve
```
