<jsp:useBean id="objeto" class="modelo.modelogenero" scope="page"></jsp:useBean>
<jsp:useBean id="objeto2" class="modelo.genero" scope="page"></jsp:useBean>
<%
 String accion =request.getParameter("accion");
 
 RequestDispatcher rd;
if(accion.equalsIgnoreCase("listar")){
    request.setAttribute("generos",objeto.listar());
    rd = request.getRequestDispatcher("genero.jsp");
            rd.forward(request, response);
}
if(accion.equalsIgnoreCase("listar1")){
    request.setAttribute("generos1",objeto.listar());
    rd = request.getRequestDispatcher("disco3.jsp");
            rd.forward(request, response);
}
if(accion.equalsIgnoreCase("agregar")){
    String genero=request.getParameter("genero");
    objeto2.setGenero(genero);
     request.setAttribute("gen",objeto.insertar(objeto2));
    rd = request.getRequestDispatcher("controlgenero.jsp?accion=listar1");
            rd.forward(request, response);
    
}
if(accion.equalsIgnoreCase("modificar")){
    int idgenero1=Integer.parseInt(request.getParameter("idgenero1"));
    String genero1=request.getParameter("genero1");
    objeto2.setIdgenero(idgenero1);
    objeto2.setGenero(genero1);
     request.setAttribute("gen1",objeto.modificar(objeto2));
    rd = request.getRequestDispatcher("controlgenero.jsp?accion=listar1");
            rd.forward(request, response);
}


%>

