# 🛰️ Termux Port Information Toolkit
### Complete Port Database (1–65535) + IANA + Termux CLI Tool

A powerful Termux-based CLI utility that allows you to:

✔ Look up any port from **1 to 65535**  
✔ View **service name**, **description**, and **IANA registered info**  
✔ Mark the port as **Open / Closed / Filtered**  
✔ Search thousands of official ports in seconds  
✔ Fully offline database  
✔ Beginner-friendly and perfect for cybersecurity students  

## 📌 Features
- 🔍 Instant port lookup
- 🗂️ Full database of all 65,535 ports
- 📝 Each entry includes:
  - Port number
  - Official service name
  - Description
  - Category
- 🗳️ User marks port status (OPEN / CLOSED / FILTERED)
- 💾 Saves lookup results (optional)
- ⚡ Super-fast optimized searching
- 🐧 Designed for Termux & Linux

## 🛠️ Installation (Termux / Linux)

```bash
pkg update && pkg upgrade -y
pkg install git -y
git clone https://github.com/techvyana20-oss/termux-port-scanner-db.git
cd porttool.sh
chmod +x porttool.sh
```

## 🚀 Run the Tool

```bash
bash port-tool.sh
```

## 📘 How It Works
The tool:
1. Asks for a port number
2. Searches the full database (1–65535)
3. Shows service name, description, and category
4. Asks the user to select OPEN / CLOSED / FILTERED
5. Prints a clean result

## 📁 Project Structure
```
|── port-tool.sh          # Main script
|── ports.db              # Full port database (Auto-generated)
|── LICENSE
|── README.md
```

## 📜 License
MIT License
