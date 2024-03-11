<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	if(request.getParameter("submit")!=null)
	{
		String username=request.getParameter("username");
		String pass=request.getParameter("password");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dance_studio","root","");
			String sql="select * from logindetailes where username=?";
			PreparedStatement p=con.prepareStatement(sql);
			p.setString(1,username);
			ResultSet r=p.executeQuery();
			if(r.next())
			{
				if(r.getString("username").equals(username))
				{
					if(r.getString("password").equals(pass))
					{
						session.setAttribute("username",username);
						if(r.getString("type").equals("Student"))
						{
							response.sendRedirect("Student/StudentDashboard.jsp");
						}
						else
						{
							response.sendRedirect("Teacher/TeacherDashboard.jsp");
						}
						
					}
					else
					{
						out.println("<script>alert('Enter the Correct Password')</script>");
					}
				}
				else
				{
					out.println("<script>alert('Enter the Correct Username')</script>");
				}
			}
			else
			{
				out.println("<script>alert('Enter the Correct Username')</script>");
			}
		}
		catch(Exception exp)
		{
			System.out.println("Some Error man "+exp);
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="LoginCss.css">
</head>
<body>
    <div class="container">          
        <div class="drop">
            <div class="login">
                <h1>Sign in</h1>
                <form class="log">
                    <div class="inputbox">
                        <input type="text" name="username" placeholder="Username" required>
                    </div>
                    <div class="inputbox">
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <div class="inputbox">
                        <input type="submit" name="submit" value="Login">
                    </div>
                </form>
            </div>
        </div>
        <a href="#" class="btn">Forgot Password</a>
        <a href="Register.jsp" class="btn signup">Sign Up</a>
    </div>
</body>
</html>
