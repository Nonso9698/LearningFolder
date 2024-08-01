
machine_type      = "e2-micro"
ubuntu            = "ubuntu-2004-focal-v20240209"
disk_size_gb      = 10
disk_type         = "pd-standard"
http              =  80  
primary_region    = "us-central1"
secondary_region  = "us-east1"
primary_project   = "kingsleyproject-427719"
secondary_project = "kenscott"
html              = "/index.html"
subnet1_region    = "us-central1"
subnet2_region    = "us-east1"


metadata = <<-SCRIPT
#!/bin/bash

# Fetch the instance ID from the metadata server
INSTANCE_ID=$(curl -H "Metadata-Flavor: Google" http://metadata/computeMetadata/v1/instance/id)

apt-get update
apt-get install -y apache2

# Enable Apache2 to start on boot
systemctl enable apache2

# Start Apache2
systemctl start apache2

# Create a simple HTML file with the fetched instance ID
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
  <style>
    /* Add animation and styling for the text */
    @keyframes colorChange {
      0% { color: red; }
      50% { color: green; }
      100% { color: blue; }
    }
    h1 {
      animation: colorChange 2s infinite;
    }
  </style>
</head>
<body>
  <h1>Terraform Project Server 1</h1>
  <h2>Instance ID: <span style="color:green">$INSTANCE_ID</span></h2>
  <p>Welcome to CloudChamp's Channel</p>
</body>
</html>
EOF
SCRIPT
