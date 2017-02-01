<%-- 
    Document   : registerUsers
    Created on : Jan 30, 2017, 5:32:40 PM
    Author     : master
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%ResultSet resultset = null;
    try {
//Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection connection
                = DriverManager.getConnection("jdbc:mysql://localhost/webill?user=webill&password=itsme");

        Statement statement = connection.createStatement();

        resultset = statement.executeQuery("select meterID from meters;");
%>

<%
    } catch (Exception e) {
        out.println("wrong entry" + e);
    }
%>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clean Energy User Registration</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>



        <form method="post" action="registerUsers">
            <div class="imgcontainer">
                <img src="cleanenergy.jpg" alt="Logo" class="logo">
            </div>
            <hr/>
            <div class="container"><h2>Customer Registration Form</h2></div>

            <div class="userTable">
                <table class ="regTable">


                    <!--  No Need to have this Value, will be autogenerated by the MySQL -->             
                    <!--                    <tr>
                                            <td>User ID<td><input type="text" name="user_ID"></td>
                                        </tr>       -->
                    <tr>
                        <td>First Name</td><td><input type="text" name="given_Name"></td>
                    </tr>
                    <tr>
                        <td>Last Name</td><td><input type="text" name="sur_Name"></td>
                    </tr>
                    <tr>
                        <td>Password<td><input type="text" name="secret_pass"></td>
                    </tr>
                    <tr>
                        <td>Address<td><input type="text" name="user_Address"></td>
                    </tr>
                    <tr>
                        <td>Email<td><input type="text" name="user_email"></td>
                    </tr>
                    <tr>
                        <td>Meter Number</td><td id="meterOptions">

                            <select name="meterID">
                                <%  String meterID;
                                    while (resultset.next()) {
                                        meterID = resultset.getString("meterID");
                                %>
                                <option value="<%= meterID%>"><%= meterID%></option>
                                <% }%>
                            </select>



                        </td>
                    </tr>
                    <tr>
                        <td>User Role</td>
                        <td>
                            <input type="radio" name="user_Role" id="customerUser" value="Customer" checked>Customer
                        </td>
                    </tr>
                </table>
                <br/><br/><button type="submit" value="Send">Register</button><br/>
            </div>
            <div class="container" style="background-color:#f1f1f1">
                <button type="button" class="cancelbtn"><a href="admin">View Customer/User List</a></button>
                <button type="reset" class="cancelbtn">Clear Contents</button>
            </div>
        </form>
    </body>
</html>