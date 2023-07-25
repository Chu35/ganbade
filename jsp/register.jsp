<html>
<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
  String user=request.getParameter("user");
  String pwd=request.getParameter("pwd");
  String name=request.getParameter("name");
  String title=request.getParameter("title");
  String depart=request.getParameter("depart");

  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  String url="jdbc:sqlserver://192.192.153.67:1433;database=school";
  Connection con = DriverManager.getConnection(url,"shu","shu");
  Statement st = con.createStatement();
  String sql="select * from teacher where id =\'"+user+"\'";
  ResultSet rs = st.executeQuery(sql);
  if (rs.next()){
     out.println(user+" 帳號已經存在");
  }else{
    sql="insert into teacher (id,name,title,depart,password) values (?,?,?,?,?)";
    PreparedStatement ps =con.prepareStatement(sql);
    ps.setString(1,user);
    ps.setString(2,name);
    ps.setString(3,title);
    ps.setString(4,depart);
    ps.setString(5,pwd);
    ps.execute();
    out.println("新增完成");
    ps.close();
  }
  rs.close();st.close();con.close();
%>
</html>