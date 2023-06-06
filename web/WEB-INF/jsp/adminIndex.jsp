<%-- 
    Document   : adminIndex
    Created on : May 20, 2023, 5:13:55 PM
    Author     : Chrispin irumva
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
        <title>Products view</title>
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
              </ul>
        </div>
    </div>
     </ul>
  </nav>
        
    <style>
        .product-image {
            width: 150px;
            height: 200px; 
        }
    </style>
    <a href="register.htm" style="display: inline-block; text-decoration: none; background-color: #4CAF50; color: white; padding: 10px 20px; border-radius: 4px; margin-right: 10px;">ADD COURSE</a>

<a href="insertresult.htm" style="display: inline-block; text-decoration: none; background-color: #4CAF50; color: white; padding: 10px 20px; border-radius: 4px; margin-right: 10px;">UPLOAD MARKS</a>

<a href="viewmarks.htm" style="display: inline-block; text-decoration: none; background-color: #4CAF50; color: white; padding: 10px 20px; border-radius: 4px;">VIEW MARKS</a>

  <a href="viewmarkstostudent.htm" style="display: inline-block; text-decoration: none; background-color: #4CAF50; color: white; padding: 10px 20px; border-radius: 4px;">VIEW EVIDENCE</a>

    
    
    

    <table >
        <tr>
            <th>ID</th>   
            <th>CourseName</th>  
            <th>CourseCode</th>  
            <th>Credit</th> 
            <th>Course IMAGE</th> 

        </tr>   
        <c:forEach items="${ProductList}" var="product">
            <tr>
                <td>${product.id}</td>    
                <td>${product.coursename}</td>
                <td>${product.coursecode}</td>
                <td>${product.credit}</td>
                <td>${product.image}</td>
                
               <td>
                        <img src="data:image/jpeg;base64,${product.imageBase64}" alt="Product Image" class="product-image">
                    </td>
                <td>
                    <a href="edit.htm?eid=${product.id}" style="display: inline-block; margin-right: 10px; padding: 8px 16px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 4px;">EDIT</a>    
<a href="delete.htm?id=${product.id}" style="display: inline-block; padding: 8px 16px; background-color: #f44336; color: white; text-decoration: none; border-radius: 4px;">DELETE</a> 
 
                </td>
            </tr>
        </c:forEach>
            
            

    </table>

</body>
</html>
