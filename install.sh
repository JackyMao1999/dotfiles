#! /bin/bash
# 这是一个一键配置脚本

# bash install.sh 不需要使用root权限运行
_spt_dir=$(cd $(dirname "${BASH_SOURCE[0]}"); pwd)

function install_sway() {
    # 安装sway、waybar、截图工具、锁屏工具、rofi快速启动、terminalor终端
    sudo apt update
    sudo apt install sway waybar grim slurp swaylock rofi terminator
    sudo cp -r ${_spt_dir}/.config/ ~/.config/
}

function install_fcitx5() {
    # 安装fcitx5输入法
    sudo apt install fcitx5 fcitx5-frontend-gtk3 fcitx5-frontend-qt5 fcitx5-chinese-addons fcitx5-rime fcitx5-config-qt
    cat << 'EOF' >> "/etc/environment"
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
INPUT_METHOD=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=fcitx
EOF
}


function main() {
    if [[ $(whoami) == "root" ]]; then
        echo "请使用普通用户运行该脚本！"
        exit 1
    fi
    # sway是一个桌面管理工具
    install_sway
    install_fcitx5

}

main "$@"
