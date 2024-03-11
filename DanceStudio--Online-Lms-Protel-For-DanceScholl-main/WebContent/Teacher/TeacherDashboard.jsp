
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
    <title>BeatBounceX</title>
    <link rel="stylesheet" href="DashboardStyle.css">
    <script>
        var countDownDate = new Date("may 22, 2023 17:48:25").getTime();
        var x=setInterval(function() {
            var now = new Date().getTime();
            var distance = countDownDate - now;
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);
            
            document.getElementById("days").innerHTML = days;
            document.getElementById("hours").innerHTML = hours;
            document.getElementById("minutes").innerHTML = minutes;
            document.getElementById("seconds").innerHTML = seconds;

        }, 1000);

    </script>
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
                <a href="#">
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
                <a href="../logout.jsp">
                 <i class="bx bxs-log-out"></i>
                 <span class="nav-item">Logout</span>
                </a>
                <span class="tooltip">Logout</span>
            </li>
        </ul>
    </div>
    <div class="main-heading">
        <center><h1> Welcome to BeatBounceX</h1></center>
    </div>
    <div class="main-content">
        <div class="box-container">
            <div class="box box1">
                <div class="text">
                    <h2 class="topic-heading">0</h2>
                    <h2 class="topic">No of Students</h2>
                </div>
                <img src="TeacherImages/students.jpg"alt="Toatl orders">
            </div>

            <div class="box box2">
                <div class="text">
                    <h2 class="topic-heading">0</h2>
                    <h2 class="topic">Rank</h2>
                </div>
                  <img src="TeacherImages/ranking.png"alt="pending">
            </div>

            <div class="box box3">
                <div class="text">
                    <h2 class="topic-heading">0</h2>
                    <h2 class="topic">Achievements</h2>
                </div>
                <img src="TeacherImages/achivementslogo.webp"alt="comments">
            </div>  
        </div>
        <div class="headings">
            <center><h1>Latest Events</h1></center>
        </div>
        <div class="bubble-container">          
            <div class="drop">
                <div class="Events">
                        <img src="TeacherImages/request.png" class="img1">
                        <h3>Do you Want conduct an Event?</h3>
                        <h4>Click Request to send a message</h4>
                        
                        <button class="Register-btn">Request</button>
                </div>
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