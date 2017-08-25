<?php
	$con = mysqli_connect("localhost", "cafeatto","zja8282!","cafeatto" );
	
	if (!$con) {
		$response = array();
		$response["success"] =  false;
		 
		echo json_encode($response);
		die("Connection failed: " . mysqli_connect_error());
	}else{
	
		$uid = $_POST["uid"];
		$upw = $_POST["upw"];
		
		$statement = mysqli_prepare($con, "select * from users where uid = ? and upw = ?");
		$bind = mysqli_stmt_bind_param($statement, "ss", $uid, $upw);
		mysqli_stmt_execute($statement);
		
		mysqli_stmt_store_result($statement);
		mysqli_stmt_bind_result($statement, $uid, $upw, $uname, $uphone, $uemail);
		
		if($bind){
			$response = array();
			$response["success"] = false;
			
			while(mysqli_stmt_fetch($statement)){
				$response["success"] = true;
				$response["uid"] = $uid;
				$response["upw"] = $upw;
				$response["uname"] = $uname;
				$response["uphone"] = $uphone;
				$response["uemail"] = $uemail;
			}
			
			echo json_encode($response);
		} else {
			$response = array();
			$response["success"] = false;
		
			echo json_encode($response);
		}			
	}
	mysqli_close($con);
	
?>