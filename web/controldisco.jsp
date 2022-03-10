<jsp:useBean id="daogrupo" class="modelo.modelogrupo" scope="page"></jsp:useBean>
<jsp:useBean id="beangrupo" class="modelo.grupo" scope="page"></jsp:useBean>
<jsp:useBean id="daogenero" class="modelo.modelogenero" scope="page"></jsp:useBean>  
<jsp:useBean id="beangenero" class="modelo.genero" scope="page"></jsp:useBean>
<jsp:useBean id="daoartista" class="modelo.modeloartista" scope="page"></jsp:useBean>
 <jsp:useBean id="beanartista" class="modelo.artista" scope="page"></jsp:useBean>
 <jsp:useBean id="beandisco" class="modelo.disco" scope="page"></jsp:useBean>
 <jsp:useBean id="daodisco" class="modelo.modelodisco" scope="page"></jsp:useBean>
<%
 String accion=request.getParameter("accion");
 RequestDispatcher rd;
 
if(accion.equalsIgnoreCase("listar")){
     request.setAttribute("grupo",daoartista.listargrupos());
     request.setAttribute("genero",daogenero.listar());
     request.setAttribute("discos",daodisco.listar());
    rd = request.getRequestDispatcher("disco2.jsp");
            rd.forward(request, response);

}


 if(accion.equalsIgnoreCase("agregar")){
     String disco=request.getParameter("disco");
     int id=Integer.parseInt(request.getParameter("idartista"));
     int idgenero=Integer.parseInt(request.getParameter("genero"));
     
     beandisco.setVolumen(disco);
     beangrupo.setIdgrupo(id);
     beandisco.setIdgrupo(beangrupo);
     beanartista.setIdartista(id);
     beandisco.setIdartista(beanartista);
     beangenero.setIdgenero(idgenero);
     beandisco.setIdgenero(beangenero);
     
   request.setAttribute("msj10",daodisco.insertar(beandisco));
   rd = request.getRequestDispatcher("controldisco.jsp?accion=listar");
            rd.forward(request, response);
 } 

if(accion.equalsIgnoreCase("modificar")){
   int idvol=Integer.parseInt(request.getParameter("idvol"));
    String volumen=request.getParameter("volumen");
    beandisco.setIddisco(idvol);
    beandisco.setVolumen(volumen);
      request.setAttribute("msj11",daodisco.modificar(beandisco));
   rd = request.getRequestDispatcher("controldisco.jsp?accion=listar");
            rd.forward(request, response);
}


if(accion.equalsIgnoreCase("listargrupo")){
    
    int idgrupo=Integer.parseInt(request.getParameter("idgrupo"));
    
      request.setAttribute("discoss",daodisco.listargrupos(idgrupo));
     rd = request.getRequestDispatcher("discoprincipal.jsp");
            rd.forward(request, response);
    
}

if(accion.equalsIgnoreCase("listargenero")){
    
    int idgenero=Integer.parseInt(request.getParameter("idgenero"));
    
      request.setAttribute("discoss",daodisco.listargenero(idgenero));
     rd = request.getRequestDispatcher("discoprincipal.jsp");
            rd.forward(request, response);
    
}

if(accion.equalsIgnoreCase("listarartista")){
    
    int idartista=Integer.parseInt(request.getParameter("idartista"));
    
      request.setAttribute("discoss",daodisco.listarartista(idartista));
     rd = request.getRequestDispatcher("discoprincipal.jsp");
            rd.forward(request, response);
    
}




%>
