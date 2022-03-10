<jsp:useBean id="objeto" class="modelo.modeloartista" scope="page"></jsp:useBean>

<%

String accion =request.getParameter("accion");
 
 RequestDispatcher rd;
if(accion.equalsIgnoreCase("listar")){
    request.setAttribute("artistas",objeto.listar());
    rd = request.getRequestDispatcher("artista.jsp");
            rd.forward(request, response);
}

if(accion.equalsIgnoreCase("listarg")){
    request.setAttribute("artistasg",objeto.listargrupos());
    rd = request.getRequestDispatcher("disco.jsp");
            rd.forward(request, response);
}


%>


