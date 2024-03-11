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
    <link rel="stylesheet" href="TeacherTimeTableStyle.css">
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
                <p class="bold"><% out.println(Name); %></p>
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
                <a href="#">
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
        <a href="#"><button class="Register-btn" >TimeTable</button></a>
        <a href="#"><button class="Register-btn">Courses</button></a>
        <h1><center>Dance Studio Class Timetable</center></h1>
	<table>
        <thead>
            <tr>
                <th>Monday</th>
                <th>Tuesday</th>
                <th>Wednesday</th>
                <th>Thrusday</th>
                <th>Friday</th>
                <th>Saturaday</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
            </tr>
            <tr>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td></td>
            </tr>
            <tr>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
            </tr>
            <tr>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </td>
                <td></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
                <td></td>
                <td><div class="class-info">
                    <h2>Class Name</h2>
                    <p>Class Time: Monday, 5:00pm-6:00pm</p>
                    <p>Tutor: Jane Doe</p>
                </div></td>
            </tr>
        </tbody>
    </table>
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