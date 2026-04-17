#!/bin/bash

#!/bin/bash

# Update system
sudo yum update -y

# Install Apache
sudo yum install httpd -y

# Start & enable Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Create professional landing page
sudo bash -c 'cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>DevOps Project - AWS ALB</title>
    <style>
        body {
            background-color: #47034F;
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 80px;
        }
        .card {
            background-color: #ffffff10;
            border-radius: 10px;
            padding: 30px;
            display: inline-block;
        }
        h1 {
            color: #00ffd5;
        }
        .highlight {
            color: #00ffd5;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="card">
    <h1>DevOps Project Deployment</h1>

    <p><strong>Infrastructure:</strong> AWS (EC2, ALB, VPC)</p>
    <p><strong>Provisioned with:</strong> Terraform</p>
    <p><strong>Architecture:</strong> Highly Available & Load Balanced</p>

    <br>

    <p>This request is served from:</p>
    <p class="highlight">\$(hostname)</p>

    <br>

    <p>Status: <span class="highlight">Application Running Successfully</span></p>
</div>

</body>
</html>
EOF'