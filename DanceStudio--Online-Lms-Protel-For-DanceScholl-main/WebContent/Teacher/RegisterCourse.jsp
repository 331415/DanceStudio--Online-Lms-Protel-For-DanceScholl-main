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
    <title>Document</title>
    <link rel="stylesheet" href="RegisterCourseStyle.css">
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
            <img src="TeacherImages\avatar.png" alt="me" class="user-img">
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
                <a href="../logout.jsp">
                 <i class="bx bxs-log-out"></i>
                 <span class="nav-item">Logout</span>
                </a>
                <span class="tooltip">Logout</span>
            </li>
        </ul>
    </div>
    
    <div class="main-content">
        <div class="main-heading">
            <center><h1>Teach the Course You Wish</h1>
            <p>* Choose from the list of courses available</p>
            <p>* Click Teach to join or to know more information</p>
            </center>
        </div>
        <div class="container">          
            <div class="drop">
                <div class="Events">
                        <img src="../images/Bharatanatyam.jfif" class="img1">
                        <h2>Bharatanatyam</h2>
                        <h4>Choreographers : Available</h4>
                        <a href="DanceDetailes.jsp?DanceType=1"><button class="Register-btn">Teach</button></a>
                        
                </div>
            </div>
            <div class="drop">
                <div class="Events">
                        <img src="../images/Kathakali.jfif" class="img1">
                        <h2>Kathakali</h2>
                        <h4>Choreographers : Available</h4>
                        <a href="DanceDetailes.jsp?DanceType=2"><button class="Register-btn">Teach</button></a>
                </div>
            </div>
            <div class="drop">
                <div class="Events">
                        <img src="../images/Kuchipudi.jpg" class="img1">
                        <h2>Kuchipudi</h2>
                        <h4>Choreographers : Available</h4>
                        <a href="DanceDetailes.jsp?DanceType=3"><button class="Register-btn">Teach</button></a>
                </div>
            </div>
            <div class="drop">
                <div class="Events">
                        <img src="../images/Hip-Hop.jpg" class="img1">
                        <h2>Hip-Hop</h2>
                        <h4>Choreographers : Available</h4>
                        <a href="DanceDetailes.jsp?DanceType=4"><button class="Register-btn">Teach</button></a>
                </div>
            </div>
            <div class="drop">
                <div class="Events">
                        <img src="../images/Disco.jpg" class="img1">
                        <h2>Disco</h2>
                        <h4>Choreographers : Available</h4>
                        <a href="DanceDetailes.jsp?DanceType=5"><button  class="Register-btn">Teach</button></a>
                </div>
            </div>
            <div class="drop">
                <div class="Events">
                        <img src="../images/Folk.jpg" class="img1">
                        <h2>Folk</h2>
                        <h4>Choreographers : Available</h4>
                        <button class="Register-btn">Teach</button>
                </div>
            </div>
            <div class="drop">
                <div class="Events">
                        <img src="../images/Latin.png" class="img1">
                        <h2>Latin</h2>
                        <h4>Choreographers : Available</h4>
                        <button class="Register-btn">Teach</button>
                </div>
            </div>
            <div class="drop">
                <div class="Events">
                        <img src="../images/Bhangra.jpg" class="img1">
                        <h2>Bhangra</h2>
                        <h4>Choreographers : Available</h4>
                        <button class="Register-btn">Teach</button>
                </div>
            </div>
            <div class="drop">
                <div class="Events">
                        <img src="../images/Breakdance.jfif" class="img1">
                        <h2>Breakdance</h2>
                        <h4>Choreographers : Available</h4>
                        <button class="Register-btn">Teach</button>
                </div>
            </div>
            <div class="drop">
                <div class="Events">
                        <img src="../images/Contemporary.jpg" class="img1">
                        <h2>Contemporary                        </h2>
                        <h4>Choreographers : Available</h4>
                        <button class="Register-btn">Teach</button>
                </div>
            </div>
            <div class="drop">
                <div class="Events">
                        <img src="../images/Tap.jfif" class="img1">
                        <h2>Tap</h2>
                        <h4>Choreographers : Available</h4>
                        <button class="Register-btn">Teach</button>
                </div>
            </div>
            <div class="drop">
                <div class="Events">
                        <img src="../images/Zumba.jpg" class="img1">
                        <h2>Zumba</h2>
                        <h4>Choreographers : Available</h4>
                        <button class="Register-btn">Teach</button>
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