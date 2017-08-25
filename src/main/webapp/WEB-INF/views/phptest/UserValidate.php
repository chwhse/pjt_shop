<?php
	$con = mysqli_connect("localhost", "cafeatto","zja8282!","cafeatto" );
	
	if (!$con) {
		$response = array();
		$response["success"] =  false;
		 
		echo json_encode($response);
		die("Connection failed: " . mysqli_connect_error());
	}else{
	
		$uid = $_POST["uid"];
		
		$statement = mysqli_prepare($con, "select uid from users where uid = ?");
		mysqli_stmt_bind_param($statement, "s", $uid);
		mysqli_stmt_execute($statement);
		mysqli_stmt_store_result($statement);
		mysqli_stmt_bind_result($statement, $uid);
		

		$response = array();
		$response["success"] = true;

		while(mysqli_stmt_fetch($statement)){
			$response["success"]=false;
			$response["uid"] = $uid;
			
		}
		
		echo json_encode($response);
	}
	mysqli_close($con);
	
?>