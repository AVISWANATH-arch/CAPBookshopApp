resource "null_resource" "create_cf_space" {

  provisioner "local-exec" {
    command = "cf create-space ${var.cf_space} -o ${var.cf_org}"
  }

}