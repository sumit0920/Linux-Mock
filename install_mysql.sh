#!/bin/bash

#Print usage
usage() {
    echo "Usage: $0 {linux|windows|amazon}"
    exit 1
}

#Function to  MySql on Linux
install_mysql_linux() {
    echo "Updating package information..."
    sudo apt-get update
    echo "Installing MySQL..."
    sudo apt-get install -y mysql-server
    echo "MySQL installation completed on Linux."
}

# Function to install MySQL on Amazon AMI
install_mysql_amazon() {
    echo "Updating package information..."
    sudo yum update -y
    echo "Installing MySQL..."
    sudo yum install -y mysql-server
    echo "Starting MySQL service..."
    sudo service mysqld start
    echo "MySQL installation completed on Amazon AMI."
}

# Function to install MySQL on Windows
install_mysql_windows() {
    echo "Downloading MySQL installer..."
    curl -LO https://dev.mysql.com/get/mysql-installer-web-community-8.0.26.0.msi
    echo "Running MySQL installer..."
    start /wait msiexec /i mysql-installer-web-community-8.0.26.0.msi /quiet
    echo "MySQL installation completed on Windows. Please configure MySQL manually."
}

# Main script logic
if [ $# -ne 1 ]; then
    usage
fi

case "$1" in
    linux)
        install_mysql_linux
        ;;
    amazon)
        install_mysql_amazon
        ;;
    windows)
        install_mysql_windows
        ;;
    *)
        usage
        ;;
esac
