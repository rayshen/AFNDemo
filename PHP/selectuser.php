<?
	include("../configmysql.php");
	mysql_select_db("chepaiDB",$q); //数据库  
	$TEMPid=$_GET['Driverid'];
	$sql = "select * from Driverinfo where Driverid=".$TEMPid;
	$query = mysql_query($sql)or die(mysql_error());
	while($row = mysql_fetch_array($query)){
        $json1 = $row;
    }
	
	$sql2 = "select * from Driverillegalinfo where IDriverid=".$TEMPid." order by Iid desc";
	$query2 = mysql_query($sql2)or die(mysql_error());
	$json2 =  array();
	$sum=0;
	while($row2 = mysql_fetch_array($query2)){
        $json2['row'.$sum] = $row2;
        $sum++;    
    }

    $newJson = json_encode(
  		array_merge(
    		array('info1' => $json1),
    		array('info2' => $json2)
  		)
	);
	echo $newJson;
?>