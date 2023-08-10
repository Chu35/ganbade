<html>
<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
  String user=request.getParameter("user");
  String pwd=request.getParameter("pwd");
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  String url="jdbc:sqlserver://192.0.0.1:1433;database=ganbade";
  Connection con = DriverManager.getConnection(url,"chu","0725");
  Statement st = con.createStatement();
  String sql="select * from teacher where id=\'"+user+"\'";
  System.out.println("登入的SQL指令:"+sql);  
  ResultSet rs = st.executeQuery(sql);
  if(rs.next()){
      String code=rs.getString("password");
      if (code.equals(pwd)){
           out.println(rs.getString("name")+" 歡迎光臨!!");
       }else out.println("帳號或密碼錯誤");
  }else out.println("帳號或密碼錯誤");
  rs.close();st.close();con.close();
%>
</html>