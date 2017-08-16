package com.dgit.pjt_shop;

import static org.junit.Assert.*;

import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;


public class MySQLConnectionTest {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/pjt_shop";
	private static final String ID = "root";
	private static final String PW = "rootroot";

	@Test
	public void testConnection() throws ClassNotFoundException{
		
		Class.forName(DRIVER);
		Connection conn = null;
		
		try {
			
			conn = DriverManager.getConnection(URL,ID,PW);
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

