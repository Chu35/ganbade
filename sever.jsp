<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Connection con = null;

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
        String username = "chu";
        String password = "0725";

        con = DriverManager.getConnection(url, username, password);

        if (con != null) {
            out.println("成功連接到資料庫！");
            System.out.println("成功連接到資料庫！");
        } else {
            out.println("連接資料庫失敗！");
            System.out.println("連接資料庫失敗！");
        }
    } catch (ClassNotFoundException e) {
        out.println("找不到數據驅動：" + e.getMessage());
        System.out.println("找不到數據驅動：" + e.getMessage());
    } catch (SQLException e) {
        out.println("連接資料庫時發生異常：" + e.getMessage());
        System.out.println("連接資料庫時發生異常：" + e.getMessage());
    } finally {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            out.println("關閉資料庫時發生異常：" + e.getMessage());
            System.out.println("關閉資料庫時發生異常：" + e.getMessage());
        }
    }
%>
