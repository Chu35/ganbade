<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<html>
<head>
    <title>修改會員資料</title>
</head>
<body>
    <%
    String user = request.getParameter("user");
    String pwd = request.getParameter("pwd");
    String name = request.getParameter("name");

    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
    Connection con = DriverManager.getConnection(url, "chu", "0725");
    Statement st = con.createStatement();

    // 检查用户是否存在
    String checkSql = "select * from member where id = ?";
    PreparedStatement checkPs = con.prepareStatement(checkSql);
    checkPs.setString(1, user);
    ResultSet checkRs = checkPs.executeQuery();

    if (checkRs.next()) {
        // 用户存在，执行更新操作
        if (pwd != null && !pwd.isEmpty()) {
            // 如果密码字段不为空，更新密码
            String updatePwdSql = "update member set pwd=? where id=?";
            PreparedStatement updatePwdPs = con.prepareStatement(updatePwdSql);
            updatePwdPs.setString(1, pwd);
            updatePwdPs.setString(2, user);

            int pwdRowsUpdated = updatePwdPs.executeUpdate();
            if (pwdRowsUpdated > 0) {
                %>
                <script>
                    alert("<%= user %> 帳號的密碼已更新");
                    window.location.href = "member.jsp";
                </script>
                <%
            } else {
                %>
                <script>
                    alert("無法更新 <%= user %> 帳號的密碼");
                    window.location.href = "member.jsp";
                </script>
                <%
            }
            updatePwdPs.close();
        }

        if (name != null && !name.isEmpty()) {
            // 如果名字字段不为空，更新名字
            String updateNameSql = "update member set name=? where id=?";
            PreparedStatement updateNamePs = con.prepareStatement(updateNameSql);
            updateNamePs.setString(1, name);
            updateNamePs.setString(2, user);

            int nameRowsUpdated = updateNamePs.executeUpdate();
            if (nameRowsUpdated > 0) {
                %>
                <script>
                    alert("<%= user %> 帳號的名字已更新");
                    window.location.href = "member.jsp";
                </script>
                <%
            } else {
                %>
                <script>
                    alert("無法更新 <%= user %> 帳號的名字");
                    window.location.href = "member.jsp";
                </script>
                <%
            }
            updateNamePs.close();
        }
    } else {
        %>
        <script>
            alert("<%= user %> 帳號不存在，無法更新");
            window.location.href = "member.jsp";
        </script>
        <%
    }

    checkRs.close();
    checkPs.close();
    st.close();
    con.close();
    %>
</body>
</html>
