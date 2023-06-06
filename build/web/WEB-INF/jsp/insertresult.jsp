<%-- 
    Document   : viewmarks
    Created on : Jun 6, 2023, 1:08:53 AM
    Author     : Ganza Chadli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>



 <style>
    /* CSS styles for the homepage */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    
    header {
      background-color: gray;
      padding: 20px;
      text-align: center;
      color: green;
    }
    
    nav ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color:green;
    }
    
    nav ul li {
      float: left;
    }
    
    nav ul li a {
      display: block;
      padding: 8px;
      text-decoration: none;
      color: #333;
    }
    
    nav ul li a:hover {
      background-color: #ddd;
    }
    
    main {
      padding: 20px;
    }
    
    footer {
      background-color: #f1f1f1;
      padding: 20px;
      text-align: center;
      margin-top: 21%;
    }
.dropbtn {
    color: #333;
    padding: 10px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    margin-left: 90%;
}

/* Style the dropdown content (hidden by default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    margin-left: 87%;
}

/* Style the links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
    background-color: #f1f1f1;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

  </style>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <nav>
    <ul>
      <li><a href="HOME.htm">LOGOUT</a></li>
         <div class="dropdown">
        <button class="dropbtn">LOGIN</button>
        <div class="dropdown-content">
              <ul>
               <a href="student.htm">STUDENT</a>
              <a href="lecture.htm">LECTURE</a>
               <a href="hod.htm">HOD</a>
               <a href="https://mis.rp.ac.rw/login">MIS LOGIN</a>
              </ul>
        </div>
    </div>
     </ul>
  </nav>
    <div class="">
        <h1>UPLOAD STUDENTS MARKS</h1>
    </div>
    <div class="container form">
        <center>        
            <form action="" method="POST">
        
  <label for="Registration" style="display: block; margin-bottom: 10px;">Select Registration:</label>
  <select name="regno" style="padding: 5px; width: 200px; margin-bottom: 10px;">
    <c:forEach items="${ProductList}" var="category">
      <option value="${category.A}" selected>
        ${category.A}
      </option>
    </c:forEach>
  </select><br>
        
  <label for="courseName" style="display: block; margin-bottom: 10px;">Select Course Name:</label>
  <select name="coursename" style="padding: 5px; width: 200px; margin-bottom: 10px;">
    <c:forEach items="${ProductList}" var="category">
      <option value="${category.coursename}" selected>
        ${category.coursename}
      </option>
    </c:forEach>
  </select><br>
    
  <form action="addevidence.htm" method="POST" enctype="multipart/form-data" style="margin-top: 20px;">
    <label for="marks" style="display: block; margin-bottom: 10px;">Enter Marks:</label>
    <input type="text" name="marks" id="marks" style="padding: 5px; width: 200px; margin-bottom: 10px;" oninput="this.setCustomValidity((isNaN(parseInt(this.value)) || parseInt(this.value) > 100) ? 'Please enter a valid marks value (0-100).' : '')" required><br>

 
    <label for="evidence" style="display: block; margin-bottom: 10px;"> Evidence by Student:</label>
    <input type="file" name="evidence" id="evidence" style="margin-bottom: 10px;" hidden=""><br>
    
    <input type="submit" value="Submit" style="padding: 10px 20px; background-color: #4CAF50; color: white; border: none; cursor: pointer;">
  </form>
</form>
</center>
    </div>
    </body>
</html>
