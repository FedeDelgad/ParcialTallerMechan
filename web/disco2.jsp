<%-- 
    Document   : disco2
    Created on : 05/03/2022, 05:34:53 AM
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
        <link href="css/disco.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
         <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
    </head>
     <body>
    <section class="menu sticky-top ">
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
            <h5 class="card-title mb-4"><i class="fa-solid fa-compact-disc"></i> Registro de Disco </h5>
            <form action="controldisco.jsp">
                <input name="idartista" type="hidden" id="idd" >
                  <div class="form-group">
                    <label for="formGroupExampleInput">Disco</label>
                    <input type="text" name="disco" class="form-control" id="formGroupExampleInput" placeholder="Ingrese Disco">
                  </div>
                  <div class="form-group">
                    <label for="formGroupExampleInput2">Grupo</label>
                    <input type="text" class="form-control" id="grupoo" placeholder="Ingrese Grupo"   data-toggle="modal" data-target="#nuevo3" readonly>
                  </div>
                 
                   <div class="form-group">
                    <label for="formGroupExampleInput2">Atista</label>
                    <input type="text" class="form-control" id="artistaa" placeholder="Ingrese Artista"  readonly>
                  </div>
                 
                   <div class="form-group">
                    <label for="formGroupExampleInput2">Genero</label>
                      <div class="input-group">
                          <select class="form-control" name="genero" >
                            <option value="" >Seleccione...</option>
                             <c:forEach var="gen" items="${genero}"> 
                            <option value="${gen.getIdgenero()}">${gen.getGenero()}</option>
                              </c:forEach>
                          </select>
                      </div>
                  </div>
                  <button type="submit" name="accion" value="agregar" class="btn btn-block btn-primary mt-5">AGREGAR</button>
            </form>
          </div>
        </div>
     </div>
        <div class="tabla p-3"> 
           <table class="table" id="datatable1">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">DISCOS</th>
                  <th scope="col">GRUPOS</th>
                  <th scope="col">ARTISTAS</th>
                   <th scope="col">GENERO</th>
                  <th scope="col">ACCIONES</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="dis" items="${discos}"> 
                <tr>
               
                  <td>${dis.getVolumen()}</td>
                  <td>${dis.getIdgrupo().getNombregrupo()}</td>
                  <td>${dis.getIdartista().getNombreartista()}</td>
                  <td>${dis.getIdgenero().getGenero()}</td>
                  <td>
                    <a class="btn btn-warning text-white " style="font-size: 13px" id="actualizar" data-toggle="modal" data-target="#nuevo2${dis.getIddisco()}"><i class="fas fa-edit"></i></a>  
                      
                      <div class="modal fade" id="nuevo2${dis.getIddisco()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                  <div class="modal-content col-sm-10 p-0">
                                    <div class="modal-header mod-h p-3 ">
                                      <h4 class="modal-title   mt-4 mb-2 ml-3  " id="exampleModalLabel"><i class="fa-solid fa-compact-disc"></i> Modificar Disco</h4>
                                      <div style="border: none" class="close   mr-2" data-dismiss="modal" aria-label="Close">
                                        &times;
                                      </div>

                                    </div>
                                      <form action="controldisco.jsp" class="p-4" method="post">
                                          <input type="hidden" name="idvol" value="${dis.getIddisco()}">
                                          <div class="form-group">
                                            <label for="formGroupExampleInput">Disco</label>
                                            <input type="text" name="volumen" class="form-control" id="formGroupExampleInput" value="${dis.getVolumen()}">
                                          </div>
                                          <div class="form-group">
                                            <label for="formGroupExampleInput2">Grupo</label>
                                            <input type="text" class="form-control" id="formGroupExampleInput2" value="${dis.getIdgrupo().getNombregrupo()}" readonly>
                                          </div>
                                          <div class="form-group">
                                            <label for="formGroupExampleInput2">Artista</label>
                                            <input type="text" class="form-control" id="formGroupExampleInput2" value="${dis.getIdartista().getNombreartista()}" readonly>
                                          </div>
                                          <div class="form-group">
                                            <label for="formGroupExampleInput2">Genero</label>
                                            <input type="text" class="form-control" id="formGroupExampleInput2" value="${dis.getIdgenero().getGenero()}" readonly>
                                          </div>
                                          <button type="submit" name="accion" value="modificar" class="btn btn-block btn-primary mt-5 mb-3">ACTUALIZAR</button>
                                      </form>   
                                  </div>
                                </div>
                            </div>
                      
                    
                    <a href="#" class="btn btn-danger text-white ml-1 "style="font-size: 13px"><i class="fas fa-trash-alt"></i></a>
                      
                    <a href="controlcancion.jsp?accion=listar&iddisco=${dis.getIddisco()}&nomdisco=${dis.getVolumen()}" class="btn  text-white ml-1 "style="font-size: 13px; background:#144B88 "><i class="fa-solid fa-list"></i></a>
                  </td>
                </tr>
              
                </c:forEach>
              </tbody>
            </table>
        </div>
    </section>
       <div class="modal fade" id="nuevo3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content  pl-3 pr-3 pb-4" style="width: 500px">
                <div class="modal-header mod-h ">
                  <h4 class="modal-title p-0  mt-2 mb-1 ml-3  " id="exampleModalLabel"><i class="fa-solid fa-users"></i> Lista de Grupos</h4>
                  <div style="border: none" class="close " data-dismiss="modal" aria-label="Close">
                    &times;
                  </div>

                </div>
              
                  <form class="d-flex mt-2 mb-3">
                    <div class="input-group ml-2 mr-2 ">
                    <div class="input-group-prepend">
                        <div class="input-group-text"><i class="fa-solid fa-magnifying-glass"></i></div>
                    </div>  
                    <input class="form-control " type="search" placeholder="Buscar" aria-label="Search" id="buscar">
                    </div>
                  </form>
                  <table class="table m-0" >
                      <thead class="thead-dark p-0 m-0 sticky-top">
                        <tr class="p-0 m-0">
                          
                          <th scope="col" >Grupos</th>
                          <th scope="col" class="pl-0 pr-0 pl-4" >Artistas</th>
                          <th scope="col" class="pl-0 ml-0 pr-2 mr-4 text-center">Accion</th> 
                          
                        </tr>
                      </thead>
                  </table>
                   <div style="height: 350px; overflow-y: auto" >
                   <table class="table m-0" >
                      <tbody id="tabla" >
                      <c:forEach var="gru" items="${grupo}"> 
                      
                        <tr>
                            
                           <td id="grupo${gru.getIdartista()}">${gru.getIdgrupo().getNombregrupo()}</td>
                           <td id="artista${gru.getIdartista()}">${gru.getNombreartista()}</td>
                           <td class=" pt-2 text-center">
                               <a  href="#" onclick="agregar('${gru.getIdartista()}')" style="font-size: 22px; color:green" data-dismiss="modal" aria-label="Close">
                              <i class="fa-solid fa-circle-plus"></i> 
                            </a>  
                            
                          </td>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                </div>
              </div>
            </div>
        </div>
         <input type="hidden" id="msj10" value="${msj10}">  
         <input type="hidden" id="msj11" value="${msj11}">  
    </body>
    
      <script src="https://kit.fontawesome.com/ef7654b222.js" crossorigin="anonymous"></script>  
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
      <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <script >        
        function agregar(id){
          
            grupo=document.getElementById("grupo"+id).innerHTML;
            artista=document.getElementById("artista"+id).innerHTML;
           
           $("#grupoo").val(grupo);
             $("#idd").val(id);
           $("#artistaa").val(artista);
        }
       
         
      
            $(document).ready(function() {
            $('#datatable1').DataTable( {
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
   
        $(document).ready(function(){
          $("#buscar").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#tabla tr").filter(function() {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
          });
        });
        
        var msj10 =document.getElementById("msj10").value;
         
         if(msj10=="Registro correcto"){
            
            Swal.fire({
            icon: 'success',
            title: msj10 , 
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
         if(msj10=="Error" ){
               Swal.fire({
            icon: 'error',
            title: 'error',
            text: 'Ingrese datos nuevamente',
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
        
         var msj11 =document.getElementById("msj11").value;
         if(msj11=="Modificado correctamente"){
            
            Swal.fire({
            icon: 'success',
            title: msj11 , 
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
         if(msj11=="Error" ){
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
