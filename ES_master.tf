

data "template_file" "userdata" {
  template = "${file("${path.module}/ES_server_setup.sh")}"
}


resource "aws_instance" "Master_elasticsearch" {

  count = 2
  ami                         = "${var.elasticsearch_master_server_ami}"
  instance_type               = "${var.elasticsearch_master_server_instance_type}"
  disable_api_termination     = false
  iam_instance_profile        = "${aws_iam_instance_profile.ES_profile.name}"
  subnet_id                   = "${var.Subnet_id}"
  key_name                    = "${var.elasticsearch_master_key_name}"
  vpc_security_group_ids      = ["${aws_security_group.ES-sg.id}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"

  user_data = "${data.template_file.userdata.rendered}"
  ebs_block_device {
    volume_size           = "${var.Elasticsearch_External_Volume_Size}"
    delete_on_termination = true
    device_name           = "/dev/sdf"
    encrypted             = false
  }
  tags        = "${merge(map("Name","${var.elasticsearch_Masterhostname}"),var.ES_tags)}"
  volume_tags = "${merge(map("Name","${var.elasticsearch_Masterhostname}"))}"
}



