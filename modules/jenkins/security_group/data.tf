data "external" "my_ip" {
    program = ["bash", "${path.module}/my_ip.sh"]

    query = {
        my_ip = "myip"
    }
}