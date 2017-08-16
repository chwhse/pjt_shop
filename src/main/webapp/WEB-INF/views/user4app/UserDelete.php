<?php

  $con = mysqli_connect("localhost", "cafeatto", "zja8282!", "cafeatto");
  
  if (!$con) {
   	$response = array();
  	$response["success"] =  false;
  	
  	echo json_encode($response); 
  	die("Connection failed: " . mysqli_connect_error());
  }else{
  	
  	$uid = $_POST["uid"];
  	
  	$stmt = mysqli_prepare($con, "DELETE FROM users WHERE uid =?");
  	mysqli_stmt_bind_param($stmt, "s", $uid);
  	mysqli_stmt_execute($stmt);
  	
  	$response = array();
  	$response["success"] = true;
  	
  	echo json_encode($response);
  }
  mysqli_close($con);
?>