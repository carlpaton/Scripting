<#  
http://www.yusufozturk.info/windows-server/how-to-create-mysql-database-with-powershell.html
https://dev.mysql.com/downloads/connector/net/
#>

$dbname = "foo"

Write-Host "* Add MySQL Data Connector " -f magenta 
[void][system.reflection.Assembly]::LoadWithPartialName("MySql.Data")
 
Write-Host "* Open Connection to SQL Server " -f magenta 
$connStr = "server=127.0.0.1;port=33061;uid=root;pwd=root"
$conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr)
$conn.Open()
 
Write-Host "* Create MySQL Database " -f magenta 
$createmysqldatabase = 'CREATE DATABASE `' + $dbname + '`'
$cmd = New-Object MySql.Data.MySqlClient.MySqlCommand($createmysqldatabase, $conn)
$da = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($cmd)
$ds = New-Object System.Data.DataSet
$da.Fill($ds)