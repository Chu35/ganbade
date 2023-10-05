<%@ page contentType="text/html;charset=utf-8" import="java.sql.*, java.util.regex.*" %>
<html>
<head>
    <title>甘吧茶ㄉㄟˊ</title>
    <script>
        function showAlert(message, redirectTo) {
            alert(message);
            window.location.href = redirectTo;
        }
    </script>
</head>
<body>
    <%
    String user = request.getParameter("user");
    String gender = request.getParameter("gender");
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");
    String memberName = null; // 初始化會員名稱
  
    if (user == null || gender == null || name == null || pwd == null) {
        out.println("<script>showAlert('請填寫所有欄位', 'signin.html');</script>");
    } else if (!Pattern.compile("^(?=.*[0-9])(?=.*[a-zA-Z]).+$").matcher(pwd).matches()) {
        out.println("<script>showAlert('密碼必須包含英文和數字', 'signin.html');</script>");
    } else {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
        try (Connection con = DriverManager.getConnection(url, "chu", "0725");
            Statement st = con.createStatement()) {
            String checkSql = "SELECT * FROM member WHERE id = ?";
            PreparedStatement checkStmt = con.prepareStatement(checkSql);
            checkStmt.setString(1, user);
            ResultSet rs = checkStmt.executeQuery();
  
            if (rs.next()) {
                out.println("<script>showAlert('" + user + " 名稱已被使用已經存在', 'signin.html');</script>");
            } else {
                String insertSql = "INSERT INTO member (id, gender, name, pwd) VALUES (?, ?, ?, ?)";
                PreparedStatement insertStmt = con.prepareStatement(insertSql);
                insertStmt.setString(1, user);
                insertStmt.setString(2, gender);
                insertStmt.setString(3, name);
                insertStmt.setString(4, pwd);
                insertStmt.execute();
                out.println("<script>showAlert('新增完成，請再次登入', 'login.html');</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>showAlert('發生錯誤：" + e.getMessage() + "', 'signin.html');</script>");
        }
    } 
    %>
</body>
</html>
