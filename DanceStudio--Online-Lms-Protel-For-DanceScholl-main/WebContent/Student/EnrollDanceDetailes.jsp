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
		String msg="";
		String code = "a";
		if(request.getParameter("DanceType")!=null)
		{
			code=request.getParameter("DanceType");
			session.setAttribute("DanceType", code);
		}
		else
		{
			code=session.getAttribute("DanceType").toString();
		}
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
			
			teach="EnrollDanceDetailes.jsp?register="+code+"&DanceType="+code;
			if(request.getParameter("submit")!=null)
			{
				    String type=request.getParameter("Type");
				    System.out.println(type);
					sql="select * from dancechoreographers where DanceCode=? and username=?";
					p=con.prepareStatement(sql);
					p.setString(1,code);
					p.setString(2,type);
					r=p.executeQuery();
					System.out.println("Yaa");
					if(r.next())
					{
						int cid=r.getInt("CourseId");
						sql="select * from studentsenrolledcourses where CourseId=? and StudentUsername=?";
						p=con.prepareStatement(sql);
						p.setInt(1, cid);
						p.setString(2,username);
						ResultSet ans=p.executeQuery();
						System.out.println("Yaa");
						if(ans.next())
						{
							msg="Already|| You have registed for this dance Course!!";
						}
						else
						{
						sql="insert into studentsenrolledcourses(CourseId,StudentUsername) values(?,?)";
						p=con.prepareStatement(sql);
						p.setInt(1, cid);
						p.setString(2,username);
						System.out.println("Yaa");
						int s=p.executeUpdate();
						System.out.println("Yaa");
						if(s>0)
						{
							System.out.println("Yaa");
							msg="Successfully|| You have registed for this dance Course!!";
						}
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
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Document</title>
    <link rel="stylesheet" href="EnrollDanceDetailesStyle.css">
    <script type="text/javascript">
    function validate()
    {
        var type=document.reg.Type.value;
        if(type=="Select")
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
            <img src="StudentImages/avatar.png" alt="me" class="user-img">
        </a>
            <div>
                <a href="#">
                <p class="bold"><%out.println(Name); %></p>
                </a>
            </div>
        </div>
        <ul>
            <li>
                <a href="StudentDashboard.jsp">
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
                <a href="StudentTimeTable.jsp">
                 <i class='bx bx-chalkboard' ></i>
                 <span class="nav-item">Classes</span>
                </a>
                <span class="tooltip">Classes</span>
            </li>
            <li>
                <a href="Courses.jsp">
                    <i class='bx bxs-registered'></i>
                 <span class="nav-item">Courses</span>
                </a>
                <span class="tooltip">Courses</span>
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
        <%if(request.getParameter("submit")!=null){
        	%>
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
                        <%
                        sql="select * from dancechoreographers where DanceCode=?";
                        p=con.prepareStatement(sql);
                        p.setString(1,code);
                        r=p.executeQuery();
                        if(r.next())
                        {
                        %>
                        <h4>Choreographers : Available</h4>
                        <form name="reg" onsubmit=validate()>
                        <div class="inputbox">
                        
                        <select name="Type">
                            <option value="Select">Select</option>
                            <%
                            String user=r.getString("username");
                        	sql="select * from usersinfo where username=?";
                        	p=con.prepareStatement(sql);
            				p.setString(1,user);
            				ResultSet res=p.executeQuery();
            				if(res.next())
            				{
                            %>
                            <option value=<%out.println(res.getString("username")); %> ><%out.println(res.getString("Name")); %></option>
                        <%
            				}
                        while(r.next())
                        {
                        	 user=r.getString("username");
                        	sql="select * from usersinfo where username=?";
                        	p=con.prepareStatement(sql);
            				p.setString(1,user);
            				res=p.executeQuery();
            				if(res.next())
            				{
            			%>
            			<option value=<%out.println(res.getString("username")); %>><%out.println(res.getString("Name")); %></option>
            			<%
            				}
                        }
                        }
                        else
                        {
                        %>
                        <h4>Choreographers : Not Available</h4>
                        <%} %>
                            
                        </select>
                        
                    </div>
                    <div class="inputbox">
                        <input type="submit" name="submit" value="Confirm">
                    </div>
                    </form>
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
<%
		}
		catch(Exception exp)
		{
			System.out.println("Error man "+exp);
		}
}
%>