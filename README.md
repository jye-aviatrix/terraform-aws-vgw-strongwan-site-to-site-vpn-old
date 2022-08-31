# terraform-aws-vgw-strongwan-site-to-site-vpn
Create AWS VGW on one VPC, and EC2 instance with StrongWAN on another VPC, create Site to Site VPN between them


Inspired by: https://github.com/aws-samples/vpn-gateway-strongswan

Note, IKEv1 is been used here.

Estimated cost
```
 Name                                                       Monthly Qty  Unit                    Monthly Cost

 aws_eip.onpremvpngw
 └─ IP address (if unused)                                          730  hours                          $3.65

 aws_secretsmanager_secret.tunnel_1_psk
 ├─ Secret                                                            1  months                         $0.40
 └─ API requests                                      Monthly cost depends on usage: $0.05 per 10k requests

 aws_secretsmanager_secret.tunnel_2_psk
 ├─ Secret                                                            1  months                         $0.40
 └─ API requests                                      Monthly cost depends on usage: $0.05 per 10k requests

 aws_vpn_connection.main
 └─ VPN connection                                                  730  hours                         $36.50

 module.cloud_test_ec2.aws_instance.this
 ├─ Instance usage (Linux/UNIX, on-demand, t2.micro)                730  hours                          $8.47
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                             8  GB                             $0.80

 module.onprem_test_ec2.aws_instance.this
 ├─ Instance usage (Linux/UNIX, on-demand, t2.micro)                730  hours                          $8.47
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                             8  GB                             $0.80

 OVERALL TOTAL                                                                                         $59.49
```