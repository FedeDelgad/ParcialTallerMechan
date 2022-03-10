<%-- 
    Document   : cancion
    Created on : 06/03/2022, 05:21:58 PM
    Author     : hp
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/cancion.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
    </head>
     <body>
    <section class="menu sticky-top">
     <nav class="navbar navbar-expand-lg navbar-dark">
          <div class="logo ml-5 pl-4 pr-4 text-white">
            <i class="fa-regular fa-circle-play"></i> DiscMusic
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
          
            <ul class="navbar-nav pl-2 pr-2 mr-5 ml-5 ml-auto" >
              <li class="nav-item salir">
                <a class="nav-link" href="controldisco.jsp?accion=listar"><i class="fa-solid fa-house"></i> Inicio</a>
              </li>
               <li class="nav-item salir">
                <a class="nav-link" href="index.html"> <i class="fas fa-sign-out-alt"></i> Salir</a>
              </li>
              
            </ul> 
              
          </div>
        </nav>   
        
    </section>    
    <section class="d-flex  men-1"> 
      <div class="formulario p-2 pt-3 ">
        <div class="card pb-2 " style="width: 26rem;">
          <div class="card-body mt-3">
              
              <h3 class="text-center disco pb-2 mt-3"><i class="fa-solid fa-compact-disc"></i> ${dis}</h3>
              <h5 class="card-title mb-4"><i class="fa-solid fa-list"></i> Registro de Canciones </h5>
              <form action="controlcancion.jsp">
                  <input type="hidden" name="iddisco1" value="${iddis}">
                  <input type="hidden"  name="nomdisco1" value="${dis}">
                  <div class="form-group">
                    <label for="formGroupExampleInput">Cancion</label>
                    <input type="text" name="cancion" class="form-control" id="formGroupExampleInput" placeholder="Ingrese Cancion">
                  </div>
                  <div class="form-group">
                    <label for="formGroupExampleInput2">Duracion</label>
                    <input type="time" name="duracion" class="form-control" id="formGroupExampleInput2" style="width: 100px">
                
                  </div>
                  <button type="submit" name="accion" value="agregar" class="btn btn-block btn-primary mt-5">AGREGAR</button>
            </form>
          </div>
        </div>
     </div>
        <div class="tabla p-3"> 
           <table class="table" id="datatable">
              <thead class="thead-dark">
                <tr>
                  
               
                  <th scope="col">CANCIONES</th>
                  <th scope="col">DURACION</th>
                  <th scope="col">ACCIONES</th>
                </tr>
              </thead>
              <tbody>
            <c:forEach var="can" items="${canciones}">  
                <tr> 
                  <td>${can.getNombrecancion()}</td>
                  <td>${can.getDuracion()}</td>
                  <td>
                    <a class="btn btn-warning text-white " style="font-size: 17px" id="actualizar" data-toggle="modal" data-target="#nuevo2${can.getIdcanciones()}"><i class="fas fa-edit"></i></a>  
                      
                      <div class="modal fade" id="nuevo2${can.getIdcanciones()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                  <div class="modal-content col-sm-10 p-0">
                                    <div class="modal-header mod-h p-3 ">
                                      <h4 class="modal-title   mt-4 mb-2 ml-3  " id="exampleModalLabel"><i class="fa-solid fa-list"></i> Modificar Cancion</h4>
                                      <div style="border: none" class="close   mr-2" data-dismiss="modal" aria-label="Close">
                                        &times;
                                      </div>

                                    </div>
                                      <form action="controlcancion.jsp?iddisco1=${iddis}&nomdisco1=${dis}" class="p-4 mt-2 " method="post">
                                          <input name="idcancion" value="${can.getIdcanciones()}">
                                          <div class="form-group">
                                            <label for="formGroupExampleInput">Cancion</label>
                                            <input type="text" name="cancion1" class="form-control" id="formGroupExampleInput" value="${can.getNombrecancion()}">
                                          </div>
                                          <div class="form-group">
                                            <label for="formGroupExampleInput2">Duracion</label>
                                            <input type="time" name="duracion1" class="form-control" id="formGroupExampleInput2" value="${can.getDuracion()}"  style="width: 100px">
                                          </div>
                                          <button type="submit" name="accion" value="modificar" class="btn btn-block btn-primary mt-5 mb-3">ACTUALIZAR</button>
                                      </form>   
                                  </div>
                                </div>
                            </div>
                      
                    
                    <a href="#" class="btn btn-danger text-white ml-1 "style="font-size: 17px"><i class="fas fa-trash-alt"></i></a>
                    
                  </td>
                </tr>
               
        </c:forEach>
              </tbody>
            </table>
        </div>
    </section>
    <input type="hidden" value="${msj1}" id="msj1">
     <input type="hidden" value="${msj2}" id="msj2">       
    </body>
    
      <script src="https://kit.fontawesome.com/ef7654b222.js" crossorigin="anonymous"></script>  
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <script >
            $(document).ready(function() {
            $('#datatable').DataTable( {
                "language": {
                    "lengthMenu": "Mostrar _MENU_ Registros por paginas",
                    "zeroRecords": "Nada encontrado - disculpa",
                    "info": "Mostrando la pagina _PAGE_ de _PAGES_",
                    "infoEmpty": "No records available",
                    "infoFiltered": "(Filtrado de _MAX_ Registros Totales)",
                    "search":"Buscar:",
                    "paginate":{
                        "next":"Siguiente",
                        "previous":"Anterior"
                    }

                }
            } );
        } );
        
         var msj1 =document.getElementById("msj1").value;
         
         if(msj1=="Registro correcto"){
            
            Swal.fire({
            icon: 'success',
            title: msj1 , 
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
         if(msj1=="Error" ){
               Swal.fire({
            icon: 'error',
            title: 'error',
            text: 'Ingrese datos nuevamente',
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
        
        
        var msj2 =document.getElementById("msj2").value;
         if(msj2=="Modificado correctamente"){
            
            Swal.fire({
            icon: 'success',
            title: msj2 , 
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
         if(msj2=="Error" ){
               Swal.fire({
            icon: 'error',
            title: 'error',
            text: 'Ingrese datos nuevamente',
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
        
        
        
        
        
        
    </script>
</html>
