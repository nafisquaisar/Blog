package com.tech.blog.helper;

import  java.sql.*;


public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection()
    {
        try{
        
         if(con==null)
         {
            //driver class laod
            
            Class.forName("com.mysql.jdbc.Driver"); 
            
            // create connection...
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","@N847403f@");            
            
         }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
