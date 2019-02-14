#/bin/bash
echo "-----------START------------------"

currentDockerFile="./Dockerfile"

#check the dockerfile exist
if [ ! -d $currentDockerFile ];then
	echo "当前目录下未找到Dockerfile文件";
	exit;
fi

#define the App name
app_name=$1

conf_file="/opt/www/docker-sh/app.conf"

#parse the conf file
function readINI()
{
 FILENAME=$1; SECTION=$2; KEY=$3
 RESULT=`awk -F '=' '/\['$SECTION'\]/{a=1}a==1&&$1~/'$KEY'/{print $2;exit}' $FILENAME`
 echo $RESULT
}

#check input
if [ ! $app_name ];then
	echo "请输入参数";
	exit;
fi

app_path=$(readINI $conf_file $app_name "app_path")
app_port=$(readINI $conf_file $app_name "app_port")

#check the app  exist
if [ ! $app_path -o ! $app_port ];then
	echo "镜像不存在";
	exit;
fi

#check the app_path exist
if [ ! -d $app_path ];then
	echo "文件夹不存在";
	exit;
fi	

#enter the app_path & build the container and run
cd $app_path

docker build -t $app_name -f Dockerfile .
docker kill $app_name
docker rm $app_name
docker run -itd --name=$app_name -p $app_port:$app_port $app_name


echo "-----------应用部署成功------------------"