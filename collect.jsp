<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <title>收藏</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
    <%
        String memberName = (String) session.getAttribute("memberName");

        if (memberName != null && !memberName.isEmpty()) {
            String knowledgeId = request.getParameter("knowledge_id");
            String funId = request.getParameter("fun_id");

            if ((knowledgeId != null && !knowledgeId.isEmpty()) || (funId != null && !funId.isEmpty())) {
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
                    Connection con = DriverManager.getConnection(url, "chu", "0725");

                    // Check if already collected
                    String checkSql1 = "SELECT * FROM member_collect WHERE member_name = ? AND knowledge_id = ?";
                    String checkSql2 = "SELECT * FROM member_collect WHERE member_name = ? AND fun_id = ?";

                    PreparedStatement checkPs1 = con.prepareStatement(checkSql1);
                    checkPs1.setString(1, memberName);
                    checkPs1.setString(2, knowledgeId);
                    ResultSet checkRs1 = checkPs1.executeQuery();

                    PreparedStatement checkPs2 = con.prepareStatement(checkSql2);
                    checkPs2.setString(1, memberName);
                    checkPs2.setString(2, funId);
                    ResultSet checkRs2 = checkPs2.executeQuery();

                    if (checkRs1.next() || checkRs2.next()) {
    %>
    <script>
        Swal.fire({
            icon: 'warning',
            title: '失敗',
            text: '已收藏',
            timer: 1000,
            timerProgressBar: true,
            showConfirmButton: false
        }).then((result) => {
            if (!result.isConfirmed) {
                var currentLocation = window.location.href;
                if (currentLocation.includes("fun")) {
                    window.location.href = "fun.jsp";
                } else if (currentLocation.includes("knowl")) {
                    window.location.href = "knowl.jsp";
                }
            } 
        });
    </script>
    
    <%
                    } else {
                        String insertSql;
                        PreparedStatement insertPs;

                        if (knowledgeId != null && !knowledgeId.isEmpty()) {
                            insertSql = "INSERT INTO member_collect (member_name, knowledge_id) VALUES (?, ?)";
                        } else {
                            insertSql = "INSERT INTO member_collect (member_name, fun_id) VALUES (?, ?)";
                        }

                        insertPs = con.prepareStatement(insertSql);
                        insertPs.setString(1, memberName);

                        if (knowledgeId != null && !knowledgeId.isEmpty()) {
                            insertPs.setString(2, knowledgeId);
                        } else {
                            insertPs.setString(2, funId);
                        }

                        int rowsInserted = insertPs.executeUpdate();

                        insertPs.close();

                        if (rowsInserted > 0) {
    %>
    <script>
        Swal.fire({
            icon: 'success',
            title: '成功',
            text: '收藏成功!!',
            timer: 1000,
            timerProgressBar: true,
            showConfirmButton: false
        }).then((result) => {
            if (!result.isConfirmed) {
                var currentLocation = window.location.href;
                if (currentLocation.includes("fun")) {
                    window.location.href = "fun.jsp";
                } else if (currentLocation.includes("knowl")) {
                    window.location.href = "knowl.jsp";
                }
            } 
        });
    </script>
    
    
    <%
                        } else {
    %>
    <script>
        Swal.fire({
            icon: 'error',
            title: '失敗',
            text: '收藏失敗，請稍後重試',
            timer: 1000,
            timerProgressBar: true,
            showConfirmButton: false
        }).then((result) => {
            if (!result.isConfirmed) {
                var currentLocation = window.location.href;
                if (currentLocation.includes("fun")) {
                    window.location.href = "fun.jsp";
                } else if (currentLocation.includes("knowl")) {
                    window.location.href = "knowl.jsp";
                }
            } 
        });
    </script>
    
    
    <%
                        }
                    }

                    checkRs1.close();
                    checkRs2.close();
                    checkPs1.close();
                    checkPs2.close();
                    con.close();

                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
    %>
    <script>
        Swal.fire({
            icon: 'error',
            title: '失敗',
            text: '收藏失敗，請稍後重試',
            timer: 1000,
            timerProgressBar: true,
            showConfirmButton: false
        }).then((result) => {
            if (!result.isConfirmed) {
                var currentLocation = window.location.href;
                if (currentLocation.includes("fun")) {
                    window.location.href = "fun.jsp";
                } else if (currentLocation.includes("knowl")) {
                    window.location.href = "knowl.jsp";
                }
            } 
        });
    </script>
    
    
    <%
                }
            }
        } else {
    %>
    <script>
        Swal.fire({
            icon: 'error',
            title: '失敗',
            text: '請先登錄會員帳號以使用收藏功能',
            showCancelButton: true,
            confirmButtonText: '前往登錄',
            cancelButtonText: '返回',
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "login.html";
            } else {
                var currentLocation = window.location.href;
    
                if (currentLocation.includes("fun")) {
                    window.location.href = "fun.jsp";
                } else if (currentLocation.includes("knowl")) {
                    window.location.href = "knowl.jsp";
                }
            }
        });
    </script>
    
    
    <%
        }
    %>
</body>
</html>
