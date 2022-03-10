<%-- 
    Document   : artista
    Created on : 03/03/2022, 02:53:19 PM
    Author     : hp
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         
         <link href="css/grupo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
      <section class="menu mb-2 sticky-top">
     <nav class="navbar navbar-expand-lg navbar-dark">
          <div class="logo ml-5 pl-4 pr-4 text-white">
            <i class="fa-regular fa-circle-play"></i> DiscMusic
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
          
            <form class="form-inline my-2 my-lg-0 ml-auto">
              <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <ul class="navbar-nav pl-2 pr-2 mr-5 ml-5" >
               <li class="nav-item salir">
                <a class="nav-link" href="index.html"> <i class="fas fa-sign-out-alt"></i> Salir</a>
              </li>
              
            </ul> 
              
          </div>
        </nav>   
        
    </section>    
    <div class="container mt-3">
        <div class="row">
        <c:forEach var="ar" items="${artistas}">  
         <a href="controldisco.jsp?accion=listarartista&idartista=${ar.getIdartista()}" style="text-decoration: none">
            <div class=" border p-0 m-2 grupo" style="height: 320px; width: 250px">
              
             <div class="text-center mt-2 pt-5 text-white " style="font-size: 70px">
              <i class="fa-solid fa-user "></i>
             </div>
            <div class="card-body pl-1 pr-1 text-center" > 
                 <div  class=" text-white tit1" style="font-size:28px">${ar.getNombreartista()} </div>
              </div>
          </div>
         </a>
        </c:forEach>
        </div>
       
     </div>
    
              
    </body>
       
      <script src="https://kit.fontawesome.com/ef7654b222.js" crossorigin="anonymous"></script>  
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
</html>