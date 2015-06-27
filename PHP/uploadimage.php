<?	
	header("Content-type: text/html; charset=UTF-8");
	include("../configmysql.php");
	mysql_select_db("chepaiDB",$q); //数据库  

	//POST获取键值对参数
	$TEMPid=$_POST['Driverid'];
	echo "\nDriverid is ".$TEMPid."\n";

	foreach ($_FILES as $_eachFile) {
		//file文件处理
		if ($_eachFile["error"] > 0)
		  {
		  echo "错误: " . $_eachFile["error"] . "\n";
		  }
		else
		  {
		  echo "文件名: " . $_eachFile["name"] . "\n";
		  echo "类型: " . $_eachFile["type"] . "\n";
		  echo "大小: " . ($_eachFile["size"] / 1024) . " Kb\n"; 
		  }
		 if (file_exists("uploadimage/" . $_eachFile["name"]))
		    {
		      echo $_eachFile["name"] . " 文件已经存在. ";
		    }
		else
		    {
		      move_uploaded_file($_eachFile["tmp_name"],
		      "uploadimage/" . $_eachFile["name"]);
		      echo "文件已经被存储到: " . "uploadimage/" . $_eachFile["name"]."\n";
		    }
	}
	/*
	//file文件处理
	if ($_FILES["file"]["error"] > 0)
	  {
	  echo "错误: " . $_FILES["file"]["error"] . "\n";
	  }
	else
	  {
	  echo "文件名: " . $_FILES["file"]["name"] . "\n";
	  echo "类型: " . $_FILES["file"]["type"] . "\n";
	  echo "大小: " . ($_FILES["file"]["size"] / 1024) . " Kb\n"; 
	  }
	 if (file_exists("uploadimage/" . $_FILES["file"]["name"]))
	    {
	      echo $_FILES["file"]["name"] . " 文件已经存在. ";
	    }
	else
	    {
	      move_uploaded_file($_FILES["file"]["tmp_name"],
	      "uploadimage/" . $_FILES["file"]["name"]);
	      echo "文件已经被存储到: " . "uploadimage/" . $_FILES["file"]["name"]."\n";
	    }
	*/
?>