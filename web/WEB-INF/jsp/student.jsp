<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>E_PORTFOLIO</title>
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
      background-color: #f1f1f1;
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
.login-form {
    width: 300px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
}

.login-form h2 {
    text-align: center;
    margin-bottom: 20px;
}

.login-form .form-group {
    margin-bottom: 15px;
}

.login-form label {
    display: block;
    font-weight: bold;
}

.login-form input[type="text"],
.login-form input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.login-form button[type="submit"] {
    width: 100%;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
}

.login-form button[type="submit"]:hover {
    background-color: #45a049;
}


  </style>
</head>
<body>
  <header>
    <h1>E_PORTFOLIO</h1>
  </header>
  
    <nav>
    <ul>
      <li><a href="HOME.htm">Home</a></li>
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
  <main>
       <div class="login-form">
        <h2><u>Student_Login</u></h2>
  <form method="POST"  onsubmit="return validateForm()" name="loginForm">            <div class="form-group">
             
            <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" name="username" /><br>
            </div>
            <div class="form-group">
                
            <input type="text" name="role" hidden="hidden" value="user" /><br>
            <label for="password">Password:</label>
            <input type="password" name="password" /><br>
        
             
            </div>
            <input type="submit" value="Login" />
            
        
        </form>
        <h2>Don't have an account yet?</h2>
        <h3><a href="registerUser.htm">Register now</a></h3>
        
    </div> 
  </main>
  <footer>
    <p>&copy; 2023 My Homepage. All rights reserved.</p>
  </footer>
</body>
</html>




