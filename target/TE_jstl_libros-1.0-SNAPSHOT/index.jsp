<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Libro" %>
<%@page import="com.emergentes.modelo.GestorLibros" %>
<% 
    if(session.getAttribute("redaccion")== null){
        GestorLibros objeto1 = new GestorLibros();
        
        objeto1.insertarLibro(new Libro(1, "Spiderman", "Stan Lee" ,"Se trata de un humano que se convierte superheroe para salvar de los malos " ,"Fisico"));
        objeto1.insertarLibro(new Libro(2, "Los dragones", "Carlos Servantes" ,"Dragones totalemnte diferentes que luchan para saber quien es mas fuerte" ,"Fisico"));
        objeto1.insertarLibro(new Libro(3, "Troya", "Homero" ,"Se trata de como dos guerreros luchan por el amor de una mujer llamada Helena" ,"Magnetico"));
        
        session.setAttribute("redaccion", objeto1);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL de libros</title>
    </head>
    <body>
        <h1>Registro de Libros </h1>
        <a href="Controller?op=nuevo">Nuevo </a>
        <table border="1">
            <tr>
                <th>Id </th>
                <th>Titulo</th>
                <th>Autor </th>
                <th>Resumen</th>
                <th> Medio</th>  
                <th> </th>
                <th> </th>
            </tr>
            <c:forEach var="item" items="${sessionScope.redaccion.getLista()}">
                <tr>
                    <td>${item.id} </td>
                    <td>${item.titulo} </td>
                    <td>${item.autor} </td>
                    <td>${item.resumen}</td>
                    <td>${item.medio} </td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a> </td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a> </td>
                </tr>
            </c:forEach>
        
    </body>
</html>
