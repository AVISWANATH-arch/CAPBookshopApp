# resource "null_resource" "create_cf_space" {

#   provisioner "local-exec" {
#     command = "cf create-space ${var.cf_space} -o ${var.cf_org}"
#   }

# }
resource "null_resource" "create_cf_space" {
  provisioner "local-exec" {
    command = "cf space bookshop-dev || cf create-space bookshop-dev -o org-build-igen43-lab-inhouse-jv4r8a7p"
  }
}