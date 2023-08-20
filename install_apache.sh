#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
echo '<h1>Web Application is Active</h1>' > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd

sudo yum update -y
sudo yum install python -y 

sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKKutiSiUoFFUz5N1eaqf4MpvpRNgDmB9XIbnPYHxxeIP6j+jd1SjsTVRITGxxQohlFJNQS6oAxD/HtH19Ag2bqdWE5cBC4d9xA0JPCNZWGUqeC3gnSfpmW66PmSP2JfMuG9eGcenvbLh1dlgnh+TEqP1bjC+1Gu01lHcQsmtxGsyvLzkDR5w4MJG92Xvkh8u2CwD1O08/iy7WSsCkbXbeIvLv9pXkwr7bXUHHhuGHqudEUIK/W2M5WBNUDYAL97UikcUT6HVb8gFgSQ2UPTg2s974N26xd5qiNLBZKGFm2fRLkUgEJbc+XLx1EOZtEfa+VfKLb9rzq5m2bpsq+9jtFvKmyVR0Sb6RMP+NKTUKtvrvVSGI2k6auTax7976rmP/bq3667ugwlxtzxHDuQHtFE3d+N0K/1YnVjRHyUzC7KOCPX4nMYwtohpav7oqiIN7FROKMRxYt2aaDf/EoV91wE9GR3bp7R/nhiViMtueWgeYrXKv8AI6PobQlxuEipc= root@ip-10-0-3-123.eu-west-2.compute.internal" >> /root/.ssh/authorized_keys