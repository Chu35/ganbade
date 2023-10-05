<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<html>
<head>
    <title>Modification Result</title>
    <script>
        function showAlert(message, redirectTo) {
            alert(message);
            window.location.href = redirectTo;
        }
    </script>
</head>
<body>
    <%
        String modifyUser = request.getParameter("modifyUser");
        String modifyPwd = request.getParameter("modifyPwd");
        String modifyField = request.getParameter("modifyField"); // 用户选择要修改的字段

        if (modifyField != null && !modifyField.isEmpty()) {
            // 执行修改操作
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
            try (Connection con = DriverManager.getConnection(url, "chu", "0725")) {
                String updateSql = "";
                
                if ("user".equals(modifyField)) {
                    updateSql = "UPDATE member SET user = ? WHERE name = ?";
                } else if ("pwd".equals(modifyField)) {
                    updateSql = "UPDATE member SET pwd = ? WHERE user = ?";
                }
                
                if (!updateSql.isEmpty()) {
                    PreparedStatement updateStmt = con.prepareStatement(updateSql);
                    updateStmt.setString(1, "user".equals(modifyField) ? modifyUser : modifyPwd);
                    updateStmt.setString(2, modifyUser);
                    int rowsUpdated = updateStmt.executeUpdate();

                    if (rowsUpdated > 0) {
                        out.println("<script>showAlert('修改完成', 'member.jsp');</script>");
                    } else {
                        out.println("<script>showAlert('找不到該用戶', 'member.jsp');</script>");
                    }
                } else {
                    out.println("<script>showAlert('無效的操作', 'member.jsp');</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>showAlert('發生錯誤', 'member.jsp');</script>");
            }
        } else {
            out.println("<script>showAlert('請選擇要修改的字段', 'member.jsp');</script>");
        }
    %>
</body>
</html>
