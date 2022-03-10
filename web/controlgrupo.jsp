<jsp:useBean id="objeto" class="modelo.modelogrupo" scope="page"></jsp:useBean>
<jsp:useBean id="objeto1" class="modelo.grupo" scope="page"></jsp:useBean>
<jsp:useBean id="objeto2" class="modelo.artista" scope="page"></jsp:useBean>
<jsp:useBean id="objeto3" class="modelo.modeloartista" scope="page"></jsp:useBean>
<%
 String accion =request.getParameter("accion");
 
 RequestDispatcher rd;
if(accion.equalsIgnoreCase("listar")){
    request.setAttribute("grupos",objeto.listar());
    rd = request.getRequestDispatcher("grupo.jsp");
            rd.forward(request, response);
}

if(accion.equalsIgnoreCase("agregar")){
    String grupo=request.getParameter("grupo");
  
    objeto1.setNombregrupo(grupo);
    request.setAttribute("gr", objeto.insertar(objeto1));
    String artista=request.getParameter("artista");
    int idgrupo=Integer.parseInt(objeto.maxgrupo());
    objeto2.setNombreartista(artista);
    objeto1.setIdgrupo(idgrupo);
    objeto2.setIdgrupo(objeto1);
    request.setAttribute("ar", objeto3.insertar(objeto2));
    rd=request.getRequestDispatcher("controlartista.jsp?accion=listarg");
            rd.forward(request, response);
}

if(accion.equalsIgnoreCase("modificar")){
    int id=Integer.parseInt(request.getParameter("id"));
    String grupo1=request.getParameter("grupo1");
    String artista1=request.getParameter("artista1");
    
    objeto1.setIdgrupo(id);
    objeto1.setNombregrupo(grupo1);
    request.setAttribute("mgr", objeto.modificar(objeto1));
    
    objeto2.setIdartista(id);
    objeto2.setNombreartista(artista1);
    request.setAttribute("mar",objeto3.modificar(objeto2));
     rd=request.getRequestDispatcher("controlartista.jsp?accion=listarg");
            rd.forward(request, response);
}


    
    
    







%>

