# OpenClaw 手机版一键安装脚本

> 在手机上运行 OpenClaw (Clawdbot) 的最简方法

## ⚡ 快速开始

### 第一步：下载 Termux

如果你还没有安装 Termux，请先下载：

**GitHub 最新版本:**
- [Termux APK (通用)](https://github.com/termux/termux-app/releases/latest)
- 或直接下载: [termux-app_v0.118.3+github-debug_universal.apk](https://github.com/termux/termux-app/releases/download/v0.118.3/termux-app_v0.118.3+github-debug_universal.apk)

**安装步骤:**
1. 下载上面的 APK 文件
2. 点击安装 Termux
3. 打开 Termux

### 第二步：运行安装脚本

在 **Termux** 中运行以下命令：

```bash
curl -fsSL https://raw.githubusercontent.com/Alpha-chen/openclaw-phone-install/master/openclaw-install.sh | bash
```

## 📋 简介

本脚本用于在 Android 手机上通过 Termux + Ubuntu 一键安装 OpenClaw AI 助手。

## 🔧 系统要求

- Android 7.0+
- Termux app
- 至少 2GB 可用存储
- 网络连接

## 📝 安装步骤

脚本会自动完成以下步骤：

| 步骤 | 操作 |
|------|------|
| 1 | 更新系统包 |
| 2 | 安装 Ubuntu Linux (proot-distro) |
| 3 | 安装基础软件 (curl, git, build-essential) |
| 4 | 安装 Node.js 22.x |
| 5 | 安装 OpenClaw |
| 6 | 配置防杀停保护 |

## 🚀 安装后配置

脚本执行完成后，运行以下命令完成配置：

```bash
# 1. 进入 Ubuntu
proot-distro login ubuntu

# 2. 启动 OpenClaw 配置向导
openclaw onboard
```

### 配置向导步骤

1. 风险提示 → 输入 `YES`
2. Onboard 模式 → 选择 `QuickStart`
3. 选择模型 → 推荐 `Haiku` (便宜)
4. 输入 API Key → 粘贴你的 API Key
5. 选择沟通方式 → `Telegram`
6. 设置技能 → 选择 `Skip for now`
7. 其他 API → 全部选择 `NO`

### 启动服务

```bash
# 开启 gateway
openclaw gateway --verbose
```

### 绑定 Telegram

1. 在 Telegram 搜索你的 Bot
2. 点击 `START`
3. 复制 Bot 回复的配对命令
4. 在 Termux 中执行配对

## 📖 详细教程

[OpenClaw 手机版部署教程 (PDF)](./OpenClaw-手机版部署教程.pdf)

## ⚠️ 注意事项

- 首次安装建议清除手机数据或恢复出厂设置
- OpenClaw 权限较多，注意保护隐私
- 建议使用便宜的模型（如 Haiku）以节省费用

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 License

MIT License

---

**有问题？** 欢迎在 GitHub 提 Issue
