#!/bin/bash
# 当前命令行用于将当前项目打包成Android的aar并上传到我们的maven仓库中，注意版本号的正确性
echo "清除缓存"
flutter clean
echo "开始打aar包-----------------请确认已修改为正确的版本号--------------------"
flutter build aar --no-debug --no-profile --build-number=1.0.7.2
echo "打aar包结束，准备上传"

# 定义用于aar、pom文件目录存放的数组
aars=()
poms=()
# 指定打包后本地仓库的目录，由于这里将此脚本放在flutter module根目录，因此直接配置了flutter module根目录下相对目录
targetPath="build/host/outputs/repo"

# 定义遍历找到所有pom文件和aar文件的函数
# 参数$1：当前查找的目录名
function findAarPom(){
	targetDir=`ls $1`
	for fileName in $targetDir
	do
		if [[ -d  $1"/"$fileName ]]; then
			# 还是目录，则递归找下一级
			findAarPom $1"/"$fileName
		else
		  # 如果是文件，判断后缀，如果符合期望，则将文件路径拼接好放于对应数组最后一位
			if [[ ${fileName:0-4} == '.aar' ]]; then
				aars[${#aars[@]}]=$1"/"$fileName
			elif [[ ${fileName:0-4} == '.pom' ]]; then
				poms[${#poms[@]}]=$1"/"$fileName
			fi
		fi
	done
}

findAarPom $targetPath
echo "============"
echo "aar有：《共${#aars[@]}个》"
echo "${aars[@]}"
echo "pom有：《共${#poms[@]}个》"
echo "${poms[@]}"
echo "============"

# 一个aar文件必然对应会有一个pom文件，如果数量不对，一定是打包出错
if [[ ${#aars[@]} -ne ${#poms[@]} ]]; then
	echo "-- !!! pom文件与aar不对称，请检查aar打包配置，上传任务 退出 !!! --"
    exit 1
fi
if [[ ${#aars[@]} == 0 ]]; then
	echo "-- !!! 未找到aar文件，请检查aar打包配置，上传任务 退出 !!! --"
    exit 1
fi

#
# 定义将目标pom及aar上传到maven指定仓库的函数
# 参数$1：为pom文件
# 参数$2：为aar文件
function upload(){
	echo "开始上传："
	echo $1
	echo $2
	# mvn上传命令，这里由于将上传用户名密码配置于 aar_maven_settings.xml中，所以无需再指定用户名密码
	mvn deploy:deploy-file \
	-DpomFile="$1" \
	-DgeneratePom=false \
	-Dfile="$2" \
	#这里会上传到我们自己的maven仓库，url/项目名称/flutter_release/1.0.3
	-Durl="http://www.baidu.com/mypro" \
	-DrepositoryId="nexus" \
	-Dpackaging=aar \
  -s="upload_aar_maven_settings.xml"
}

# 循环上传
for (( i=0;i<${#aars[@]};i++ )); do
    echo "正在处理第$[$i+1]个，共${#aars[@]}个"
    upload "${poms[$i]}" "${aars[$i]}"
done

echo "所有事件都已完成，去maven上看看有没有吧，hiahiahiahia~~~"
