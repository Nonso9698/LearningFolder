# Set the project ID
gcloud config set project [YOUR_PROJECT_ID]

# Create a new Cloud SQL instance
gcloud sql instances create [INSTANCE_NAME] --tier=db-n1-standard-1 --region=[REGION]

# Set the root password for your Cloud SQL instance
gcloud sql users set-password root --host=% --instance [INSTANCE_NAME] --password [PASSWORD]

# Connect to the Cloud SQL instance
gcloud sql connect [INSTANCE_NAME] --user=root

# Once connected, you can use standard SQL commands, for example:
# Show databases
SHOW DATABASES;

# Create a new database
CREATE DATABASE [DATABASE_NAME];

# Use a specific database
USE [DATABASE_NAME];

# Show tables in the current database
SHOW TABLES;

# Create a new table
CREATE TABLE [TABLE_NAME] (
  id INT NOT NULL AUTO_INCREMENT,
  column1 VARCHAR(100),
  column2 INT,
  PRIMARY KEY (id)
);

# Insert data into a table
INSERT INTO [TABLE_NAME] (column1, column2) VALUES ('value1', 123);

# Select data from a table
SELECT * FROM [TABLE_NAME];

# Update data in a table
UPDATE [TABLE_NAME] SET column1='new value' WHERE id=1;

# Delete data from a table
DELETE FROM [TABLE_NAME] WHERE id=1;
