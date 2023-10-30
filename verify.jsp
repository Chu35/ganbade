<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
  String user = request.getParameter("user");
  String pwd = request.getParameter("pwd");
  String memberName = null;
  boolean 登錄成功 = false; 
  boolean 密碼錯誤 = false; 
  boolean 未註冊 = false; 

  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
  Connection con = DriverManager.getConnection(url, "chu", "0725");
  Statement st = con.createStatement();
  String sql = "select * from member where name='" + user + "'";
  System.out.println("登录的SQL指令:" + sql);
  ResultSet rs = st.executeQuery(sql);
  
  if (rs.next()) {
      String code = rs.getString("pwd");
      if (code.equals(pwd)) {
           memberName = rs.getString("name"); 
           登錄成功 = true; 

           if (session != null) {
               session.setAttribute("memberName", memberName); 
           }
      } else {
        密碼錯誤 = true;
      }
  } else {
    未註冊 = true; 
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
        window.location.href = "index.jsp"; 
    </script>
<%
    } else if (密碼錯誤) {
%>
    <script>
        alert("帳號或密碼錯誤");
        window.location.href = "login.html"; 
    </script>
<%
    } else if (未註冊) {
%>
    <script>
        alert("尚未註冊");
        window.location.href = "signin.html"; 
    </script>
<%
    }
%>
</body>
</html>
