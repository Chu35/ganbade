<html>
<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%  
  boolean flag=false;
  String std=request.getParameter("sno");
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  String url="jdbc:sqlserver://192.192.153.67:1433;database=school";
  Connection con = DriverManager.getConnection( url, "shu", "shu");
  Statement st = con.createStatement();   
  String sql="select S.id,name,avg(score) as average from student S, course C ";
         sql=sql+" where S.id=C.id and S.id like \'%"+std+"%\' group by S.id,name";
  if (flag) out.print("sql="+sql+"<hr/>");
  ResultSet rs = st.executeQuery(sql);
  while(rs.next()){
    out.println("學生:"+rs.getString("id")+rs.getString("name")+" 平均成績:"+rs.getFloat("average")+"<br/>");
  }
  rs.close(); st.close(); con.close();
%>
</html>