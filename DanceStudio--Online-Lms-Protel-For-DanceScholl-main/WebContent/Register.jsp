<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	if(request.getParameter("reg_submit")!=null)
	{
		if(request.getParameter("Type").equals("Select")!=true)
		{
		String user,pass,type,name,mobile,email;
		name=request.getParameter("name");
		pass=request.getParameter("password1");
		type=request.getParameter("Type");
		mobile=request.getParameter("username");
		email=request.getParameter("email");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/dance_studio","root","");
			String sql="select * from usersinfo where username=?";
			PreparedStatement p;
			p=con.prepareStatement(sql);
			p.setString(1, mobile);
			ResultSet r =p.executeQuery();
			if(r.next())
			{
				if(r.getString("username").equals(mobile))
				{
					out.println("<script>alert('ERROR!! User Already exists with that Mobile no')</script>");
				}
			}
			else
			{
				sql="insert into usersinfo values(?,?,?,?)";
				p=con.prepareStatement(sql);
				p.setString(1, mobile);
				p.setString(2,name);
				p.setString(3,email);
				p.setString(4,type);
				
				int s=p.executeUpdate();
				if(s>0)
				{
					sql="insert into logindetailes values(?,?,?)";
					p=con.prepareStatement(sql);
					p.setString(1,mobile);
					p.setString(2,pass);
					p.setString(3,type);
					s=p.executeUpdate();
					if(s>0){
					out.println("<script>alert('SUCESS!! registered Successfullt please click login and proceed')</script>");
					}
				}
				else
				{
					out.println("<script>alert('ERROR!! Some Error occured internally please try after some time')</script>");
				}
			}
			
		}
		catch(Exception exp)
		{
			System.out.println("Error MAn  "+exp);
		}
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
    <link rel="stylesheet" href="RegisterCss.css">
    <script>
        function validate()
        {
            var username=document.reg.username.value;
            var pass1=document.reg.password1.value;
            var pass2=document.reg.password2.value;
            var type=document.reg.Type.value;
            if(username.length!=10)
            {
            	document.reg.Type.value="Select";
                alert("Please Enter Valid Mobile No");
                return false;
            }
            else if(pass1!=pass2)
            {
                alert("Password and Confirm Password must be same");
                document.reg.Type.value="Select";
                return false;
            }
            else if(type=="Select")
            {
            	document.reg.Type.value="Select";
                alert("Please Select User Type");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">         
        <div class="drop">
            <div class="login">
                <h1>Sign up</h1>
                <form name="reg" onsubmit=validate()>
                	<div class="inputbox">
                        <input type="text" name="name" placeholder="Name" required >
                    </div>
                    <div class="inputbox">
                        <input type="number" name="username" placeholder="Mobile No" required >
                    </div>
                    <div class="inputbox">
                        <input type="password" name="password1" placeholder="Password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                    </div>
                    <div class="inputbox">
                        <input type="password" name="password2" placeholder="Confirm Password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                    </div>
                    <div class="inputbox">
                        <input type="email" name="email" placeholder="Email" required>
                    </div>
                    <div class="inputbox">
                        <select name="Type">
                            <option value="Select">Select</option>
                            <option value="Student">Student</option>
                            <option value="Teacher">Choriographers</option>
                        </select>
                    </div>
                    <div class="inputbox">
                        <input type="submit" name="reg_submit" value="Confirm">
                    </div>
                </form>
            </div>
        </div>
        <a href="Login.jsp" class="btn">Login</a>
    </div>
</body>
</html>