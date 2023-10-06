<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
  String user = request.getParameter("user");
  String pwd = request.getParameter("pwd");
  String memberName = null; // 初始化會員名稱
  boolean 登錄成功 = false; // 初始化登錄成功狀態

  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  String url = "jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
  Connection con = DriverManager.getConnection(url, "chu", "0725");
  Statement st = con.createStatement();
  String sql = "select * from member where name='" + user + "'";
  System.out.println("登入的SQL指令:" + sql);
  ResultSet rs = st.executeQuery(sql);
  
  if (rs.next()) {
      String code = rs.getString("pwd");
      if (code.equals(pwd)) {
           memberName = rs.getString("name"); // 取得會員名稱
           登錄成功 = true; // 設定登錄成功狀態

           if (session != null) {
               session.setAttribute("memberName", memberName); // 存儲會員名稱到會話
           }
      }
  }
  rs.close();
  st.close();
  con.close();
%>

<!DOCTYPE html>
<html>
<head>
    <title>甘吧茶ㄉㄟˊ</title>
</head>
<body>
<%
    if (登錄成功) {
%>
    <script>
        alert("<%= memberName %> 歡迎光臨!!");
        window.location.href = "index.jsp"; // 導向到會員畫面
    </script>
<%
    } else {
%>
<script>
    alert("尚未註冊");
    window.location.href = "signin.html"; // 導向回登錄頁面
</script>
    <script>
        alert("帳號或密碼錯誤");
        window.location.href = "login.html"; // 導向回登錄頁面
    </script>
<%
    }
%>
</body>
</html>

