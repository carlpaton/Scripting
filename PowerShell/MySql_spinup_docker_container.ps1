<#  
https://github.com/charleyza/DockerDemo/blob/master/Docker%20For%20Windows/linux%20containers/mysql/create-container-mysql_p5.ps1
#>

$version = 5.7
$container_name = "mysql_5.7"
$port = "33061:3306"

Write-Host "* pull mysql:" $version -f magenta 
docker pull mysql:$version

Write-Host "* kill and rm " $container_name -f magenta
docker container kill $container_name
docker rm $container_name

Write-Host "* run detatched and start " $container_name -f magenta
docker run --detach --name=$container_name -p $port --env="MYSQL_ROOT_PASSWORD=root" mysql:$version
docker start $container_name

Write-Host "* list containers" -f magenta
docker ps --all