#!/bin/bash
# OpenClaw 手机版一键安装脚本
# 使用方法: curl -fsSL https://raw.githubusercontent.com/Alpha-chen/openclaw-phone-install/master/openclaw-install.sh | bash

set -e

# 颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔═══════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   OpenClaw 手机版一键安装 v1.0       ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════╝${NC}"

# ============================================
# 第0步：检查并下载 Termux
# ============================================
if [ ! -d "/data/data/com.termux" ]; then
    echo -e "${YELLOW}[0/6] 正在下载 Termux...${NC}"
    
    # Termux 最新版本下载链接 (GitHub)
    TERMUX_URL="https://github.com/termux/termux-app/releases/download/v0.118.3/termux-app_v0.118.3+github-debug_universal.apk"
    
    # 尝试下载
    if command -v wget &> /dev/null; then
        wget -O termux.apk "$TERMUX_URL" || TERMUX_URL="https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_universal.apk"
    else
        curl -fSL -o termux.apk "$TERMUX_URL" || TERMUX_URL="https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_universal.apk"
    fi
    
    echo -e "${RED}╔═══════════════════════════════════════════╗${NC}"
    echo -e "${RED}║  请先安装 Termux 再运行此脚本         ║${NC}"
    echo -e "${RED}╚═══════════════════════════════════════════╝${NC}"
    echo ""
    echo "下载链接: $TERMUX_URL"
    echo ""
    echo "安装步骤:"
    echo "  1. 下载上面的 APK 文件"
    echo "  2. 点击安装 Termux"
    echo "  3. 重新运行此脚本"
    exit 1
fi

# ============================================
# 第1步：更新系统
# ============================================
echo -e "${GREEN}[1/6] 更新系统...${NC}"
pkg update -y && pkg upgrade -y

# ============================================
# 第2步：安装 Ubuntu
# ============================================
echo -e "${GREEN}[2/6] 安装Ubuntu...${NC}"
pkg install proot-distro -y
proot-distro install ubuntu

# ============================================
# 第3步：安装基础软件
# ============================================
echo -e "${GREEN}[3/6] 安装基础软件...${NC}"
proot-distro login ubuntu -i -u "apt update && apt install -y curl git build-essential"

# ============================================
# 第4步：安装 Node.js
# ============================================
echo -e "${GREEN}[4/6] 安装Node.js...${NC}"
proot-distro login ubuntu -i -u "curl -fsSL https://deb.nodesource.com/setup_22.x | bash && apt install -y nodejs"

# ============================================
# 第5步：安装 OpenClaw
# ============================================
echo -e "${GREEN}[5/6] 安装OpenClaw...${NC}"
proot-distro login ubuntu -i -u "npm install -g openclaw@latest"

# ============================================
# 第6步：配置防杀停
# ============================================
echo -e "${GREEN}[6/6] 配置防杀停...${NC}"
proot-distro login ubuntu -i -u 'cat > /root/hijack.js << EOF
const os = require("os");
os.networkInterfaces = () => ({});
EOF
echo "export NODE_OPTIONS=\"-r /root/hijack.js\"" >> ~/.bashrc'

# ============================================
# 完成
# ============================================
echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✅ 安装完成！                        ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════╝${NC}"
echo ""
echo "下一步:"
echo "  1. proot-distro login ubuntu"
echo "  2. openclaw onboard"
echo "  3. 按提示完成配置"
echo ""
echo "详细教程: https://github.com/Alpha-chen/openclaw-phone-install"
