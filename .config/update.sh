#! /bin/bash

# 请不要使用sudo运行该脚本
_spt_dir=$(cd $(dirname "${BASH_SOURCE[0]}"); pwd)
_local_cfg_dir="${HOME}/.config"

if [[ $(whoami) == "root" ]]; then
    echo "请不要使用root权限运行该脚本"
    exit 1
fi
# 更新当前设备的配置参数
cfg_list=("sway" "waybar" "rofi")

for cfg in ${cfg_list[@]}; do
    cp -r "${_local_cfg_dir}/${cfg}/" "${_spt_dir}"
    echo "cp ${cfg} config"
done
