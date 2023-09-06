<html>
<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%  
  String kid=request.getParameter("kid");
  String uri="jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
  String user="chu";
  String pwd="0725";

  try {
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con = DriverManager.getConnection(uri, user, pwd);
    Statement st = con.createStatement();
    String sql = "SELECT id,name FROM Knowledge WHERE id=\'"+kid+"\'";
    ResultSet rs = st.executeQuery(sql);

    if (rs.next()) {
        out.println(kid+"名稱" + rs.getString("name"));
        out.println("Name:" + rs.getString("name"));
    }else
    out.println(kid+"資料不存在");
    rs.close();st.close();con.close();
} catch (Exception e) {
    System.out.println("An error occurred: " + e.getMessage());
}

%>
</html>