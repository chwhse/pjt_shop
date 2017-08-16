<?php

  $con = mysqli_connect("localhost", "cafeatto", "zja8282!", "cafeatto");
  
  if (!$con) {
   	$response = array();
  	$response["success"] =  false;
  	
  	echo json_encode($response); 
  	die("Connection failed: " . mysqli_connect_error());
  }else{
  	$response = array();
  	$result = mysqli_query($con, "SELECT * FROM users;");
  	while ($row = mysqli_fetch_array($result)) {
  		array_push($response, 
  		  array("uid"=>$row[0],
  				"upw"=>$row[1],
  				"uname"=>$row[2],
  				"uphone"=>$row[3],
  				"uemail"=>$row[4]
  		  )
  		);
  	}

  	
  	

  	echo json_encode(array("response"=>$response)); 
  	$response = array();
  	$response["success"] =  false;
  	 
  	echo json_encode($response);
  	
  }
	mysqli_close($con);
	
  
?>