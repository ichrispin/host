<%-- 
    Document   : adminIndex
    Created on : May 20, 2023, 5:13:55 PM
    Author     : Chrispin irumva
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products view</title>
    </head>

    <body>
    <style>
        .product-image {
            width: 150px;
            height: 200px; 
        }
    </style>
    <a href="register.htm"class="">ADD COURSE</a>
  
    
    
    

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
                    <a href="edit.htm?id=${product.id}">EDIT</a>    
                    <a href="delete.htm?id=${product.id}">DELETE</a> 
                </td>
            </tr>
        </c:forEach>
            
            

    </table>

</body>
</html>
