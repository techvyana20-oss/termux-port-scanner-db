#!/bin/bash

# === ULTIMATE PORT INFORMATION TOOL (AUTO-UPDATES FROM IANA) ===

PORTFILE="ports.db"
IANA_URL="https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv"

# Create or update database from IANA
update_ports_database() {
    echo "[+] Downloading complete port list from IANA..."
    
    curl -s "$IANA_URL" -o ports.csv

    if [ ! -f ports.csv ]; then
        echo "❌ Failed to download IANA port list!"
        exit
    fi

    echo "[+] Parsing port information..."
    
    # Create database file
    > $PORTFILE

    # Skip CSV header and parse: Service, Port, Protocol, Description
    tail -n +2 ports.csv | while IFS=',' read -r service port protocol desc extra
    do
        # Only process valid ports (numbers)
        if [[ "$port" =~ ^[0-9]+$ ]]; then
            echo "$port|$service|$desc" >> $PORTFILE
        fi
    done

    rm ports.csv
    echo "[+] Database updated successfully!"
}

# Check if database exists
if [ ! -f "$PORTFILE" ]; then
    update_ports_database
else
    echo "[+] Port database found."
    echo "Do you want to update the port database? (y/n)"
    read choice
    if [ "$choice" == "y" ]; then
        update_ports_database
    fi
fi


echo "=============================="
echo "     PORT INFORMATION TOOL"
echo "=============================="

# Ask for port number
read -p "Enter Port Number: " PORT

# Validate number
if ! [[ "$PORT" =~ ^[0-9]+$ ]] ; then
    echo "❌ Invalid port number!"
    exit
fi

# Ask for status
echo ""
echo "Select Port Status:"
echo "1) Open"
echo "2) Closed"
echo "3) Filtered"
read -p "Enter option (1/2/3): " STATUS

case $STATUS in
    1) STATE="OPEN";;
    2) STATE="CLOSED";;
    3) STATE="FILTERED";;
    *) echo "❌ Invalid option!"; exit;;
esac


# Search port details
INFO=$(grep -E "^$PORT\|" "$PORTFILE")

echo ""
echo "------------------------------"
echo "         PORT RESULT"
echo "------------------------------"

if [ -z "$INFO" ]; then
    echo "Port: $PORT"
    echo "Service: Unknown"
    echo "Description: Not available in IANA list"
else
    SERVICE=$(echo "$INFO" | cut -d "|" -f2)
    DESC=$(echo "$INFO" | cut -d "|" -f3)

    echo "Port: $PORT"
    echo "Service: $SERVICE"
    echo "Description: $DESC"
fi

echo "Status: $STATE"
echo "------------------------------"
