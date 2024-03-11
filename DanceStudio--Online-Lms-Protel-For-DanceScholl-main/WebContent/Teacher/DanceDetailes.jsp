<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	if(session.getAttribute("username")==null || session.getAttribute("username")=="" )
	{
		response.sendRedirect("../Login.jsp");
	}
	else
	{
		String username=session.getAttribute("username").toString();
		String Name="error";
		String info="Dance Information";
		String ImageName="img";
		String DanceName="name";
		String teach="t";
		String msg="Alert message";
		String code = request.getParameter("DanceType");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dance_studio","root","");
			String sql="select * from usersinfo where username=?";
			PreparedStatement p=con.prepareStatement(sql);
			p.setString(1,username);
			ResultSet r=p.executeQuery();
			if(r.next())
			{
				Name= r.getString("name");
			}
			sql="select * from courses where DanceCode=?";
			p=con.prepareStatement(sql);
			p.setString(1, code);
			
			r=p.executeQuery();
			if(r.next())
			{
				DanceName= r.getString("DanceName");
				info= r.getString("DanceInfo");
				ImageName= r.getString("ImageName");
			}
			ImageName="../images/"+ImageName;
			
			teach="DanceDetailes.jsp?enroll="+code+"&DanceType="+code;
			if(request.getParameter("enroll")!=null)
			{
				code=request.getParameter("enroll");
				sql="select * from dancechoreographers where DanceCode=? and username=?";
				p=con.prepareStatement(sql);
				p.setString(1,code);
				p.setString(2,username);
				r=p.executeQuery();
				if(r.next())
				{
					msg="Already You have registed for this dance to teach!!";
				}
				else
				{
					sql="insert into dancechoreographers(DanceCode,username) values(?,?)";
					p=con.prepareStatement(sql);
					p.setString(1,code);
					p.setString(2,username);
					int s=p.executeUpdate();
					if(s>0)
					{
						msg="Successfully|| You have registed for this dance to teach!!";
					}
					
				}
			}
			
			}
		catch(Exception exp)
		{
			System.out.println("Error man "+exp);
		}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Document</title>
    <link rel="stylesheet" href="DanceDetailesStyle.css">
</head>
<body>
    <div class="sidebar">
        <div class="top">
            <div class="logo">
                <i class='bx bxs-speaker'></i>
                <span>BeatBounceX</span>
            </div>
            <i class="bx bx-menu" id="btn"></i>
        </div>
        <div class="user">
            <a href="#">
            <img src="TeacherImages/avatar.png" alt="me" class="user-img">
        </a>
            <div>
                <a href="#">
                <p class="bold"><%out.println(Name); %></p>
                </a>
            </div>
        </div>
        <ul>
            <li>
                <a href="TeacherDashboard.jsp">
                 <i class="bx bxs-grid-alt"></i>
                 <span class="nav-item">Dashboard</span>
                </a>
                <span class="tooltip">Dashboard</span>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxs-graduation'></i>
                 <span class="nav-item">Attendance</span>
                </a>
                <span class="tooltip">Attendance</span>
            </li>
            <li>
                <a href="TeacherTimeTable.jsp">
                 <i class='bx bx-chalkboard' ></i>
                 <span class="nav-item">Classes</span>
                </a>
                <span class="tooltip">Classes</span>
            </li>
            <li>
                <a href="RegisterCourse.jsp">
                    <i class='bx bxs-registered'></i>
                 <span class="nav-item">Register</span>
                </a>
                <span class="tooltip">Register</span>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxl-paypal'></i>
                 <span class="nav-item">Payments</span>
                </a>
                <span class="tooltip">Payments</span>
            </li>
            <li>
                <a href="#">
                 <i class="bx bxs-log-out"></i>
                 <span class="nav-item">Logout</span>
                </a>
                <span class="tooltip">Logout</span>
            </li>
        </ul>
    </div>
    
    <div class="main-content">
        <div class="main-heading">
        <%if(request.getParameter("enroll")!=null){ %>
        <center><h1><%out.println(msg); %></h1></center>
        <%} %>
            <center><h1><%out.println(DanceName); %></h1>
            </center>
        </div>
        <div class="container">
            <center>          
            <div class="drop">
                <div class="Events">
                        <img src=<% out.println(ImageName); %>  class="img1">
                        <h2><%out.println(DanceName); %></h2>
                        <h4>Choreographers : Available</h4>
                        <a href=<%out.println(teach); %>><button class="Register-btn">Enroll</button></a>
                        
                </div>
            </div></center>
            <div class="info">
                <p><% out.println(info); %></p>
            </div>
        </div>
    </div>
</body>
<script>
    let btn = document.querySelector('#btn')
    let sidebar = document.querySelector('.sidebar')
    btn.onclick = function(){
        sidebar.classList.toggle('active')
    };
</script>  
</html>
<%}%>