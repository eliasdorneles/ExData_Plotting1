#!/bin/bash
# Shell-script to extract data only for dates 01/02/2007 and 02/02/2007
# from the dataset of household power consumption available

abort() {
    echo "$*"; exit 1;
}

url_zipfile="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile="household_power_consumption.zip"

# abort script if there is an error
set -e

# download the zip file, if does not exists already
[ -f "$zipfile" ] || wget -O "$zipfile" "$url_zipfile"

unzip -p "$zipfile" | grep -E "^(Date|[12]/2/2007)" > 02-2007-household_power_consumption.csv
