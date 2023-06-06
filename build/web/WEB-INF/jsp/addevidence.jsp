<%-- 
    Document   : edit
    Created on : Jun 5, 2023, 12:35:39 AM
    Author     : CHRISPIN IRUMVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        
       
            .btn{

                height: 30px;
                width: 300px;
                margin-top: 5px;
                background-color:green;
                color:#fff;
                margin-left: 5px;

            }
            .label{
                border: none;
                text-align:  center;
                border-bottom: solid 2px;
                height: 30px;
                width: 300px;
                margin-top: 0px;
                font-size: 16px;
            }
            .container form{
                width: 90%;
                max-width: 600px;
                padding: 50px 50px 50px;
                background: #fff;
                border-radius: 4px;
                box-shadow: 0 4px 30px rgba(0,0,0,0.5);
                position: relative;
                margin-left: -650px;
                margin-top: -150px;

            }
            .container{
                min-height: 60vh;
                display: flex;
                align-items: center;
                justify-content: center;


            }
            h1{
                color: blue;

            }
            h3{
                margin-top:  20px;

            }
    </style>

   
        
        
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
              </ul>
        </div>
    </div>
     </ul>
  </nav>
        <h1>Hello World!</h1>
        
        
        <form action="" method="POST" style="font-family: Arial, sans-serif;">
 
  <input type="text" name="id" value="${EditProducts[0].id}"hidden="">
  
 
  <input type="text" name="coursename" value="${EditProducts[0].coursename}" hidden="">
  
 
  <input type="text" name="coursecode" value="${EditProducts[0].regno}"  hidden="">
  
 
  <input type="text" name="credit" value="${EditProducts[0].marks}" hidden="">
  
  
  <input type="file" name="evidence" value="${EditProducts[0].evidence}" >
  
  <input type="submit" name="submit" value="ADD EVIDENCE" >
  
  <a href="HOME.htm" style="text-decoration: none; color: #333; display: block; text-align: center;">BACK HOME</a>
</form>


        
        
    </body>
</html>
