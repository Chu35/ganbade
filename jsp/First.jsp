<html><meta charset="utf-8" />
大家好
</html>


<html>
<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  String url="jdbc:sqlserver://192.192.153.67:1433;database=school";
  Connection con = DriverManager.getConnection( url, "shu", "shu");
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery("select * from student");
  while(rs.next()){
    out.println("學號:"+rs.getString("id")+", 姓名:"+rs.getString("name")+"<br/>");

  }
  rs.close(); st.close(); con.close();
%>
</html>