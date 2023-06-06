<%-- 
    Document   : HOME
    Created on : Jun 1, 2023, 8:18:31 PM
    Author     : RWIBUTSO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
  
  <main style="background-image: url('images/a2.jpg'); background-size: cover;">
    <!-- Your content goes here -->
</main>

</head>
<body>
  <header>
    <h1 style="font-family: 'Arial', sans-serif; font-size: 4rem; color: #333; text-align: center; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 20px; position: relative;">
    <span style="position: relative; display: inline-block;">
        <span style="display: inline-block; border-bottom: 3px solid #ff3366; padding-bottom: 5px;">E</span> 
        <span style="display: inline-block; color: #ff3366;">PORTFOLIO</span>
    </span>
</h1>

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
               <a href="https://mis.rp.ac.rw/">EMSLOGIN</a>
              </ul>
        </div>
    </div>
     </ul>
  </nav>
    <main style="background-image: url('image/a2.jpg'); background-size: cover;">
    <!-- Your content goes here -->
</main>

    <div style="position: absolute; width: 30%; height: 53%;">
        <h2>Related Information</h2>
        <p>
            An e-portfolio, short for electronic portfolio, is a digital collection of a person's work, accomplishments, skills, and experiences. It serves as a comprehensive and dynamic representation of an individual's professional or academic journey. E-portfolios are typically hosted online and can be accessed and shared easily via the internet.
        </p>
        <p>
            An e-portfolio provides a platform for individuals to showcase their achievements and demonstrate their expertise to potential employers, academic institutions, or other interested parties. It can include various types of content, such as:
        </p>
        <ul>
            <li>Personal information: An e-portfolio may include a bio or personal statement that introduces the individual and provides an overview of their background, interests, and goals.</li>
            <li>Resume/CV: It can feature a digital version of the individual's resume or curriculum vitae, highlighting their educational qualifications, work experience, skills, and achievements.</li>
        </ul>
    </div>

    <div style="position: absolute; width: 30%; height: 53%; margin-left: 35%;">
        <h2>Related Information</h2>
        <p>
            An e-portfolio, short for electronic portfolio, is a digital collection of a person's work, accomplishments, skills, and experiences. It serves as a comprehensive and dynamic representation of an individual's professional or academic journey. E-portfolios are typically hosted online and can be accessed and shared easily via the internet.
        </p>
        <p>
            An e-portfolio provides a platform for individuals to showcase their achievements and demonstrate their expertise to potential employers, academic institutions, or other interested parties. It can include various types of content, such as:
        </p>
        <ul>
            <li>Personal information: An e-portfolio may include a bio or personal statement that introduces the individual and provides an overview of their background, interests, and goals.</li>
            <li>Resume/CV: It can feature a digital version of the individual's resume or curriculum vitae, highlighting their educational qualifications, work experience, skills, and achievements.</li>
        </ul>
    </div>

    <div style="position: absolute; width: 30%; height: 53%; margin-left: 68%; background-image: url('your-image.jpg'); background-size: cover;">
        <h2>Related Information</h2>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in pulvinar arcu. Aliquam ut libero magna. Donec sit amet hendrerit metus. Sed non mi at ligula pellentesque fringilla at ut turpis. Fusce a efficitur mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce sagittis dapibus orci, ut dapibus nulla malesuada non.
        </p>
        <p>
            Integer semper enim non enim hendrerit, non posuere tellus varius. Curabitur eu elit diam. Sed eu sapien sit amet quam consectetur efficitur. Nam tincidunt ipsum a nisl iaculis, vel viverra mi interdum. Sed sed fringilla neque, ac interdum ipsum. Donec sed condimentum enim, a lacinia purus. Suspendisse fringilla aliquam lorem sed efficitur.
        </p>
    </div>
</main>


    
    <br><br><br><br><br><br><br><br><br>
  
  <footer>
    <p>&copy; 2023 My Homepage. All rights reserved.</p>
  </footer>
</body>
</html>



