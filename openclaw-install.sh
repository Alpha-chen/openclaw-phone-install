#!/bin/bash
# OpenClaw 手机版一键安装脚本
# 使用方法: curl -fsSL https://your-server/openclaw-install.sh | bash
# 或者: bash <(curl -fsSL https://your-server/openclaw-install.sh)

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

# 检查Termux
[ ! -d "/data/data/com.termux" ] && echo -e "${RED}错误: 请在Termux中运行${NC}" && exit 1

echo -e "${GREEN}[1/6] 更新系统...${NC}"
pkg update -y && pkg upgrade -y

echo -e "${GREEN}[2/6] 安装Ubuntu...${NC}"
pkg install proot-distro -y
proot-distro install ubuntu

echo -e "${GREEN}[3/6] 安装基础软件...${NC}"
proot-distro login ubuntu -i -u "apt update && apt install -y curl git build-essential"

echo -e "${GREEN}[4/6] 安装Node.js...${NC}"
proot-distro login ubuntu -i -u "curl -fsSL https://deb.nodesource.com/setup_22.x | bash && apt install -y nodejs"

echo -e "${GREEN}[5/6] 安装OpenClaw...${NC}"
proot-distro login ubuntu -i -u "npm install -g openclaw@latest"

echo -e "${GREEN}[6/6] 配置防杀停...${NC}"
proot-distro login ubuntu -i -u 'cat > /root/hijack.js << EOF
const os = require("os");
os.networkInterfaces = () => ({});
EOF
echo "export NODE_OPTIONS=\"-r /root/hijack.js\"" >> ~/.bashrc'

echo -e "${GREEN}✅ 安装完成！${NC}"
echo ""
echo "下一步:"
echo "  1. proot-distro login ubuntu"
echo "  2. openclaw onboard"
echo "  3. 按提示完成配置"
