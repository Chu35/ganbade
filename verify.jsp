<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>甘吧茶ㄉㄟˊ</title>

    <!-- 引入 SweetAlert2 库 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        // 函数用于显示成功的警告框
        function showSuccessAlert(memberName) {
            Swal.fire({
                icon: 'success',
                title: '成功',
                text: memberName + ' 歡迎光臨!!',
                willClose: () => {
                    // 确认按钮（OK 按钮）被点击后执行页面跳转
                    window.location.href = "index.jsp";
                }
            });
        }
    </script>
</head>
<body>
<%
    String user = request.getParameter("user");
    String pwd = request.getParameter("pwd");
    String memberName = null;
    boolean 登錄成功 = false;
    boolean 密碼錯誤 = false;
    boolean 未註冊 = false;

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
        con = DriverManager.getConnection(url, "chu", "0725");
        st = con.createStatement();

        String sql = "select * from member where name='" + user + "'";
        System.out.println("登录的SQL指令:" + sql);
        rs = st.executeQuery(sql);

        if (rs.next()) {
            String code = rs.getString("pwd");
            if (code.equals(pwd)) {
                memberName = rs.getString("name");
                登錄成功 = true;

                if (session != null) {
                    session.setAttribute("memberName", memberName);
                }

                // Check if the user is "chu" and the password is "chu0725"
                if (user.equals("chu") && pwd.equals("chu0725")) {
%>
                    <script>
                        window.location.href = "cms.jsp";
                    </script>
<%
                } else {
%>
                    <script>
                        showSuccessAlert('<%= memberName %>'); // 调用 SweetAlert2 函数
                    </script>
<%
                }
            } else {
                密碼錯誤 = true;
            }
        } else {
            未註冊 = true;
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<%
    if (!登錄成功) {
        if (密碼錯誤) {
%>
            <script>
                Swal.fire({
                    icon: 'error',
                    title: '錯誤',
                    text: '帳號或密碼錯誤',
                }).then(() => {
                    window.location.href = "login.html";
                });
            </script>
<%
        } else if (未註冊) {
%>
            <script>
                Swal.fire({
                    icon: 'error',
                    title: '錯誤',
                    text: '尚未註冊',
                }).then(() => {
                    window.location.href = "signin.html";
                });
            </script>
<%
        }
    }
%>
</body>
</html>
