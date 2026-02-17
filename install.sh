#!/bin/bash
# Installation script for Bank Financial Report CLI Tool
# Compatible with Kali Linux and Debian-based systems

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║         🏦 BANK FINANCIAL REPORT CLI - INSTALLER                 ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
   echo -e "${YELLOW}⚠️  Warning: Running as root${NC}"
fi

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    echo -e "${GREEN}✓ Detected OS: $OS${NC}"
else
    echo -e "${YELLOW}⚠️  Could not detect OS, assuming Debian-based${NC}"
    OS="Unknown"
fi

# Check Python installation
echo -e "\n${BLUE}📋 Checking Python installation...${NC}"
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    echo -e "${GREEN}✓ Found: $PYTHON_VERSION${NC}"
else
    echo -e "${RED}✗ Python3 not found. Installing...${NC}"
    apt-get update
    apt-get install -y python3 python3-pip
fi

# Install required packages
echo -e "\n${BLUE}📦 Installing required Python packages...${NC}"

REQUIRED_PACKAGES="openpyxl pandas"
for package in $REQUIRED_PACKAGES; do
    echo -e "${BLUE}  → Installing $package...${NC}"
    pip3 install $package -q
    echo -e "${GREEN}  ✓ $package installed${NC}"
done

# Create installation directory
INSTALL_DIR="/usr/local/bin"
TOOL_NAME="bankfin"
SCRIPT_PATH="$INSTALL_DIR/$TOOL_NAME"

echo -e "\n${BLUE}📂 Installing to $INSTALL_DIR...${NC}"

# Copy and setup the main script
if [ -f "bank_financial_report.py" ]; then
    cp bank_financial_report.py "$SCRIPT_PATH"
    chmod +x "$SCRIPT_PATH"
    
    # Create wrapper script
    cat > "$SCRIPT_PATH" << 'EOF'
#!/usr/bin/env python3
import sys
import os

# Add the script directory to path
script_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, script_dir)

# Import and run main
from bank_financial_report import main

if __name__ == "__main__":
    main()
EOF
    
    # Copy the actual module
    cp bank_financial_report.py "$INSTALL_DIR/bank_financial_report.py"
    chmod +x "$INSTALL_DIR/bank_financial_report.py"
    
    echo -e "${GREEN}✓ Tool installed successfully${NC}"
else
    echo -e "${RED}✗ bank_financial_report.py not found in current directory${NC}"
    exit 1
fi

# Create symlink if needed
if [ ! -L "/usr/bin/$TOOL_NAME" ]; then
    ln -sf "$SCRIPT_PATH" "/usr/bin/$TOOL_NAME" 2>/dev/null || true
fi

# Create desktop entry (optional)
DESKTOP_DIR="$HOME/Desktop"
if [ -d "$DESKTOP_DIR" ]; then
    cat > "$DESKTOP_DIR/BankFinancialReport.desktop" << EOF
[Desktop Entry]
Name=Bank Financial Report
Comment=CLI Tool for Bank Financial Reports
Exec=gnome-terminal -- bankfin
Type=Application
Terminal=true
Icon=accessories-calculator
Categories=Office;Finance;
EOF
    chmod +x "$DESKTOP_DIR/BankFinancialReport.desktop"
    echo -e "${GREEN}✓ Desktop shortcut created${NC}"
fi

# Create config directory
CONFIG_DIR="$HOME/.config/bankfin"
mkdir -p "$CONFIG_DIR"

# Install bash completion
if [ -f "bankfin-completion.bash" ]; then
    cp bankfin-completion.bash /etc/bash_completion.d/bankfin 2>/dev/null || true
    echo -e "${GREEN}✓ Bash completion installed${NC}"
fi

echo -e "\n${GREEN}╔══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                    INSTALLATION COMPLETE!                        ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════════╝${NC}"

echo -e "\n${BLUE}📖 Usage:${NC}"
echo -e "   ${YELLOW}bankfin${NC}                    - Run interactive mode"
echo -e "   ${YELLOW}bankfin --demo${NC}             - Run with demo data"
echo -e "   ${YELLOW}bankfin -o report.xlsx${NC}     - Generate report to file"
echo -e "   ${YELLOW}bankfin --help${NC}             - Show help"

echo -e "\n${BLUE}📁 Configuration directory:${NC} $CONFIG_DIR"
echo -e "${BLUE}📝 Log file:${NC} $CONFIG_DIR/transactions.log"

echo -e "\n${GREEN}✅ Installation successful! Type 'bankfin' to start.${NC}\n"
