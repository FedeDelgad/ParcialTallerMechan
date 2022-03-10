 <jsp:useBean id="beandisco" class="modelo.disco" scope="page"></jsp:useBean>
 <jsp:useBean id="daodisco" class="modelo.modelodisco" scope="page"></jsp:useBean>
<jsp:useBean id="daocancion" class="modelo.modelocancion" scope="page"></jsp:useBean>
<jsp:useBean id="beancancion" class="modelo.cancion" scope="page"></jsp:useBean>
<%

 String accion=request.getParameter("accion");
 RequestDispatcher rd;
 

if(accion.equalsIgnoreCase("listar")){
    
    String nomdisco=request.getParameter("nomdisco");
    int iddisco=Integer.parseInt(request.getParameter("iddisco"));
    request.setAttribute("dis",nomdisco);
    request.setAttribute("iddis",iddisco);
    request.setAttribute("canciones",daocancion.listar(iddisco));
    
   rd = request.getRequestDispatcher("cancion.jsp");
            rd.forward(request, response); 
}

if(accion.equalsIgnoreCase("agregar")){
    int iddisco1=Integer.parseInt(request.getParameter("iddisco1"));
    String nomdisco1=request.getParameter("nomdisco1");
    String cancion=request.getParameter("cancion");
    String duracion=request.getParameter("duracion");
    
    beancancion.setNombrecancion(cancion);
    beancancion.setDuracion(duracion);
    beandisco.setIddisco(iddisco1);
    beancancion.setIddisco(beandisco);
    request.setAttribute("msj1",daocancion.insertar(beancancion));
    
    rd = request.getRequestDispatcher("controlcancion.jsp?accion=listar&iddisco="+iddisco1+"&nomdisco="+nomdisco1);
            rd.forward(request, response);
}

if(accion.equalsIgnoreCase("modificar")){
    int iddisco1=Integer.parseInt(request.getParameter("iddisco1"));
    String nomdisco1=request.getParameter("nomdisco1");
    int idcancion=Integer.parseInt(request.getParameter("idcancion"));
    String cancion1=request.getParameter("cancion1");
    String duracion1=request.getParameter("duracion1");
    
    beancancion.setIdcanciones(idcancion);
    beancancion.setNombrecancion(cancion1);
    beancancion.setDuracion(duracion1);
     request.setAttribute("msj2",daocancion.modificar(beancancion));
    
    rd = request.getRequestDispatcher("controlcancion.jsp?accion=listar&iddisco="+iddisco1+"&nomdisco="+nomdisco1);
            rd.forward(request, response); 
}

if(accion.equalsIgnoreCase("listarcanciones")){
  request.setAttribute("canc",daocancion.listarcanciones());
  rd = request.getRequestDispatcher("cancionprincipal.jsp");
            rd.forward(request, response);  
}


if(accion.equalsIgnoreCase("listarcancioness")){
   int iddisco=Integer.parseInt(request.getParameter("iddiscos"));
  request.setAttribute("canc",daocancion.listarcancioness(iddisco));
  rd = request.getRequestDispatcher("cancionprincipal.jsp");
            rd.forward(request, response);  
}





%>

