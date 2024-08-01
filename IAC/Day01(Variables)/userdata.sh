#!/bin/bash
apt update
apt install -y apache2

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2

# Define the metadata URL
METADATA_URL="http://metadata.google.internal/computeMetadata/v1"

# Get the instance ID using the instance metadata
INSTANCE_ID=$(curl -s -H "Metadata-Flavor: Google" $METADATA_URL/instance/id)

# Install the Google Cloud SDK (if needed)
# apt install -y google-cloud-sdk

# Create a simple HTML file with the portfolio content and display the images
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

