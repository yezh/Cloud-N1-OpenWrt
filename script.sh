#!/bin/bash
cd openwrt

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 添加feed源 kenzok8是op的常用软件包及passwall基本依赖
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git kenzok https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
sed -i '$a src-git node https://github.com/nxhack/openwrt-node-packages' feeds.conf.default
sed -i '$a src-git weifuture https://github.com/hongweifuture/openwrt-packages' feeds.conf.default
sed -i '$a src-git pwdep https://github.com/hongweifuture/pwdep.git' feeds.conf.default

# wireless
#rm -rf files/etc/config/wireless
#rm -rf files/etc/modules.d/wireless_enable
# Add luci-app-openclash
git clone https://github.com/vernesong/OpenClash.git package-temp
mv -f package-temp/luci-app-openclash package/lean/
rm -rf package-temp
# Add luci-theme-opentomcat
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git theme-temp/luci-theme-opentomcat
rm -rf theme-temp/luci-theme-opentomcat/LICENSE
rm -rf theme-temp/luci-theme-opentomcat/README.md
mv -f theme-temp/luci-theme-opentomcat package/lean/
rm -rf theme-temp
default_theme='opentomcat'
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci
# Add luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package-temp/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package-temp/luci-app-vssr
git clone https://github.com/xiaorouji/openwrt-passwall.git package-temp/openwrt-passwall
git clone https://github.com/rosywrt/luci-theme-rosy.git package-temp/luci-theme-rosy
git clone https://github.com/tty228/luci-app-serverchan.git package-temp/luci-app-serverchan
git clone https://github.com/brvphoenix/wrtbwmon.git package-temp/wrtbwmon
git clone https://github.com/brvphoenix/luci-app-wrtbwmon.git package-temp/luci-app-wrtbwmon
git clone https://github.com/nodejs/node.git package-temp/node
git clone https://github.com/kenzok8/small.git package-temp/small
cp -r package-temp/small/* package/lean/
mv -f package-temp/lua-maxminddb package/lean/
mv -f package-temp/luci-app-vssr package/lean/
rm -rf package-temp
