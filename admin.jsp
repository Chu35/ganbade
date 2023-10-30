<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>網站後台</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>用戶管理後台</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>用戶名稱</th>
            <th>gender</th>
        </tr>

        <% 
        String dbURL = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
        String user = "chu";
        String password = "0725";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(dbURL, user, password);

            String sqlQuery = "SELECT * FROM member";
            Statement statement = conn.createStatement();
            ResultSet result = statement.executeQuery(sqlQuery);

            while (result.next()) {
                String id = result.getString("id");
                String name = result.getString("name");
                String gender = result.getString("gender");

                out.println("<tr>");
                out.println("<td>" + id + "</td>");
                out.println("<td>" + name + "</td>");
                out.println("<td>" + gender + "</td>");
                out.println("</tr>");
            }

            result.close();
            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </table>

    <style>
        /* styles.css */
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
    <script>
        function showUserInfo(id) {
            alert('您選擇了用戶ID ' + id);
        }

        // 添加點擊事件處理程序，當點擊表格行時調用showUserInfo函數
        const rows = document.querySelectorAll('table tr');
        for (const row of rows) {
            row.addEventListener('click', function () {
                const id = row.cells[0].textContent; // 獲取用戶ID
                showUserInfo(id);
            });
        }
    </script>
</body>
</html>
