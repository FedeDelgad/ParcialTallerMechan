<%-- 
    Document   : disco
    Created on : 04/03/2022, 11:41:38 AM
    Author     : hp
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
          <link href="css/disco.css" rel="stylesheet" type="text/css"/>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
                <a class="nav-link" href="controlartista.jsp?accion=listarg"><i class="fa-solid fa-users"></i>  Grupos</a>
              </li>
              <li class="nav-item salir">
                <a class="nav-link" href="controlgenero.jsp?accion=listar1"><i class="fa-solid fa-headphones-simple"></i>  Genero</a>
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
            <h5 class="card-title mb-4"><i class="fa-solid fa-users"></i> Registro de Grupo Musicales</h5>
            <form action="controlgrupo.jsp" method="post">
                  <div class="form-group">
                    <label for="formGroupExampleInput">Grupo</label>
                    <input type="text" name="grupo" class="form-control" id="formGroupExampleInput" placeholder="Ingrese Grupo">
                  </div>
                  <div class="form-group">
                    <label for="formGroupExampleInput2">Artista</label>
                    <input type="text" name="artista" class="form-control" id="formGroupExampleInput2" placeholder="Ingrese Artista">
                  </div>
                <button type="submit" name="accion" value="agregar" class="btn btn-block btn-primary mt-5">AGREGAR</button>
            </form>
            <input type="hidden" id="msj1" value="${gr}">
            <input type="hidden"  id="msj2" value="${ar}">
          </div>
        </div>
     </div>
        <div class="tabla p-3"> 
           <table class="table" id="datatable">
              <thead class="thead-dark">
                <tr>
                  
                  <th scope="col">GRUPOS MUSICALES</th>
                  <th scope="col">ARTISTAS MUSICALES</th>
                  <th scope="col">ACCIONES</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="ag" items="${artistasg}">   
                <tr>
               
                  <td>${ag.getIdgrupo().getNombregrupo()}</td>
                  <td>${ag.getNombreartista()}</td>
                  <td>
                    <a class="btn btn-warning text-white " style="font-size: 17px" id="actualizar" data-toggle="modal" data-target="#nuevo2${ag.getIdartista()}"><i class="fas fa-edit"></i></a>  
                      
                      <div class="modal fade" id="nuevo2${ag.getIdartista()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                  <div class="modal-content col-sm-10 p-0">
                                    <div class="modal-header mod-h p-3 ">
                                      <h4 class="modal-title   mt-4 mb-2 ml-3  " id="exampleModalLabel"><i class="fa-solid fa-users"></i> Modificar Grupo Musical</h4>
                                      <div style="border: none" class="close   mr-2" data-dismiss="modal" aria-label="Close">
                                        &times;
                                      </div>

                                    </div>
                                      <form action="controlgrupo.jsp" class="p-4 mt-2">
                                          <input type="hidden" name="id" value="${ag.getIdartista()}">
                                          <div class="form-group">
                                            <label for="formGroupExampleInput">Grupo</label>
                                            <input type="text" class="form-control" name="grupo1" id="formGroupExampleInput" value="${ag.getIdgrupo().getNombregrupo()}">
                                          </div>
                                          <div class="form-group">
                                            <label for="formGroupExampleInput2">Atista</label>
                                            <input type="text" class="form-control" name="artista1" id="formGroupExampleInput2" value="${ag.getNombreartista()}">
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
            <input  type="hidden" id="msj3" value="${mgr}">
            <input  type="hidden" id="msj4" value="${mar}">
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
          var msj2 =document.getElementById("msj2").value;
         if(msj1=="Registro correcto" && msj2=="Registro correcto"){
            
            Swal.fire({
            icon: 'success',
            title: msj1 , 
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
         if(msj1=="Error" || msj2=="Error"){
               Swal.fire({
            icon: 'error',
            title: 'error',
            text: 'Ingrese sus datos nuevamente',
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
        
         var msj3 =document.getElementById("msj3").value;
          var msj4 =document.getElementById("msj4").value;
          
          if(msj4=="Modificado correctamente" && msj3=="Modificado correctamente"){
            
            Swal.fire({
            icon: 'success',
            title: msj3 , 
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
         
          if(msj4=="Error" || msj3=="Error"){
               Swal.fire({
            icon: 'error',
            title: 'error',
            text: 'Ingrese sus datos nuevamente',
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
        
    </script>
</html>
