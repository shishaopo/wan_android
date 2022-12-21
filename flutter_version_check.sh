#!/bin/bash
#用于检查当前分支的flutter版本和本地版本有什么区别，如果不一样的话，修改本地flutter版本
echo -e "\033[34m检查当前分支的flutter版本\033[0m"
#声明解析yaml的方法
function parse_yaml() {
  local prefix=$2
  local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @ | tr @ '\034')
  sed -ne "s|^\($s\):|\1|" \
    -e "s|^\($s\)\($w\)$s:${s}[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
    -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p" $1 |
    awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}
#执行解析yaml的方法
eval $(parse_yaml "pubspec.yaml" "conf_")

echo -e "\033[34m读取yaml的flutter值为 : ${conf_environment_flutter}\033[0m"

realVersion=${conf_environment_flutter}
#判断是不是^开头
if [[ $realVersion == ^* ]]; then
  realVersion=${realVersion:1}
fi
#获取到真正的版本，例：3.0.5
echo -e "\033[34m当前分支需要的flutter版本为 : ${realVersion}\033[0m"

echo -e "\033[34m开始检查本地flutter版本，可能耗时较长\033[0m"
#这里通过执行flutter --version命令查看本地版本
localVersionValue=$(flutter --version)
localVersionValue=${localVersionValue:0:50}
echo -e "\033[34m本地的flutter信息 : ${localVersionValue}\033[0m"

#判断本地版本是否包含3.0.5，如果包含说明版本一样
if [[ $localVersionValue =~ $realVersion ]]; then
  echo -e "\033[31m检查本地flutter版本和需要的flutter版本一致，结束\033[0m"
  exit 0
else
  echo -e "\033[34m检查本地flutter版本和需要的flutter版本不一致，准备更换版本，可能耗时较长\033[0m"
fi

echo -e "\033[34m先把flutter切换到stable分支\033[0m"
flutter channel stable
echo -e "\033[34m获取flutter最新版本\033[0m"
flutter upgrade
echo -e "\033[34m进入到flutterSDK的目录里面\033[0m"
cd "$(dirname $(which flutter))"
#echo -e "\033[34m拉一下最新代码？？？？这里是不是可以去掉，flutter upgrade应该就会更新最新代码了\033[0m"
#git checkout .
#git pull origin
echo -e "\033[34m切换到需要的分支上\033[0m"
git checkout ${realVersion}
echo -e "\033[34m校验一下是否成功\033[0m"
flutter doctor
echo -e "\033[34m回到当前flutter项目，更新依赖\033[0m"
cd $(dirname $0)
flutter pub get
echo -e "\033[31m切换flutter版本${realVersion}成功，结束\033[0m"
