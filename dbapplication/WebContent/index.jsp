
<%@ page import="java.sql.*"%>
<html>
<head>
<title> Displaying data from mysql database</title>
</head>

<body>
<h1>hello, </h1>

<%
  String db = "testdb";
  String user = "admin"; // assumes database name is the same as username
  String password = "1234";
  try {
    java.sql.Connection con;
    
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/"+db, user, password);
    out.println("");
    out.println (db+ " database successfully opened.");
    
    %>
      <table style="width:50%"   border="1" >
    <tr>
    <th width="25%">id</th>
    <th width="25%">first name</th>
    <th width="25%">last name</th>
    <th width="25%">location</th>  
    </tr>
    </table>
    
    <%
    
    Statement stat = con.createStatement();
    ResultSet rs = stat.executeQuery("select * from user");
  
    while(rs.next())
    {
    %>
     <table style="width:50%"   border="1" >
     <tr>        
        <td width="25%"><%=rs.getInt("user_id") %></td>
        <td width="25%"><%=rs.getString("first_name") %></td>
        <td width="25%"><%=rs.getString("last_name") %></td>
        <td width="25%"><%=rs.getString("location") %></td>
        </tr>   
    </table>
    <%
    }
    
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>

</body>
</html>