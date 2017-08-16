<?php

  $con = mysqli_connect("localhost", "cafeatto", "zja8282!", "cafeatto");
  
  if (!$con) {
	  	$response = array();
	  	$response["success"] =  false;
	  	
	  	echo json_encode($response);
	  	die("Connection failed: " . mysqli_connect_error());
  }else{
   
	  $uid = $_POST["uid"];
	  $upw = $_POST["upw"];
	  $uname = $_POST["uname"];
	  $uphone = $_POST["uphone"];
	  $uemail = $_POST["uemail"];
	   
	  $query ="INSERT INTO users (uid,upw,uname,uphone,uemail) VALUES (?, ?, ?, ?, ?)";
	  
	  $statement = mysqli_prepare($con, $query);
	  $bind = mysqli_stmt_bind_param($statement, "sssis", $uid, $upw, $uname, $uphone, $uemail);
	  mysqli_stmt_execute($statement);
	 
	  if ($bind) {
	  	$response = array();
	  	$response["success"] = true;
	  	
	  	echo json_encode($response);
	  } else {
	  	$response = array();
	  	$response["success"] = false;
	  	
	  	echo json_encode($response);
	  }
  
  
  
  }
  mysqli_close($con);
?>
﻿