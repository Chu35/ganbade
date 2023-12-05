<%@ page contentType="text/html;charset=utf-8" import="java.sql.*, java.util.regex.*" %>
<html>
<head>
    <title>甘吧茶ㄉㄟˊ</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function showAlert(message, alertType) {
            Swal.fire({
                icon: alertType === 'success' ? 'success' : 'error',
                title: alertType === 'success' ? '成功' : '錯誤',
                text: message,
                timer: 1000,
                timerProgressBar: true,
                showConfirmButton: false
            }).then(() => {
                if (alertType === 'success') {
                    window.location.href = 'login.html';
                } else {
                    window.history.back();
                }
            });
        }
    </script>    
</head>
<body>
    <%
        String user = request.getParameter("user");
        String gender = request.getParameter("gender");
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");

        if (user == null || gender == null || name == null || pwd == null) {
            out.println("<script>showAlert('請填寫所有欄位', 'error');</script>");
        } else if (!Pattern.compile("^(?=.*[0-9])(?=.*[a-zA-Z]).+$").matcher(pwd).matches()) {
            out.println("<script>showAlert('密碼必須包含英文和數字', 'error');</script>");
        } else {
            Connection con = null;
            PreparedStatement checkStmt = null;

            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
                con = DriverManager.getConnection(url, "chu", "0725");

                String checkSql = "SELECT * FROM member WHERE id = ?";
                checkStmt = con.prepareStatement(checkSql);
                checkStmt.setString(1, user);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    out.println("<script>showAlert('" + user + " 名稱已被使用已經存在', 'error');</script>");
                } else {
                    String insertSql = "INSERT INTO member (id, gender, name, pwd) VALUES (?, ?, ?, ?)";
                    PreparedStatement insertStmt = con.prepareStatement(insertSql);
                    insertStmt.setString(1, user);
                    insertStmt.setString(2, gender);
                    insertStmt.setString(3, name);
                    insertStmt.setString(4, pwd);
                    insertStmt.execute();
                    out.println("<script>showAlert('新增完成，請再次登入',  'success');</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>showAlert('發生錯誤：" + e.getMessage() + "', 'error');</script>");
            } finally {
                try {
                    if (checkStmt != null) {
                        checkStmt.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } 
    %>
</body>
</html>
