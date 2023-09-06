<html><meta charset="utf-8"/>
 <%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%

   String db="Team00";  //小組資料庫
   String user="user00"; //小組帳號
   String pwd="user00"; //小組密碼

   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   String url="jdbc:sqlserver://127.0.0.1:1433;database="+db;
   Connection con = DriverManager.getConnection(url, user, pwd);
  
   String id=request.getParameter("id");
   if (id==null) id="";
   String dept=request.getParameter("dept");
   PreparedStatement st = con.prepareStatement("select * from Student where id=? or dept like ?");
   st.setString(1,id);
   st.setString(2,"%"+dept+"%");
   ResultSet rs = st.executeQuery();
   int cnt=0;  //序號
   out.println("<table border=1>");
   while (rs.next()){
       cnt++;
       id=rs.getString("id");
       out.println("<tr><td><a href=Detail.jsp?id="+id+">"+cnt+"</a></td>");
       out.println("<td>"+rs.getString("id")+"</td>");
       out.println("<td>"+rs.getString("dept")+"</td>");
       out.println("<td>"+rs.getString("name")+"</td></tr>");
   }
  out.println("</table>");
   rs.close(); st.close();

 %>
</html>