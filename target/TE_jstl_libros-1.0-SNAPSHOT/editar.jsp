<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTl Libros</title>
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
                Registro de
            </c:if>
            <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
                Modificar
            </c:if>
                libro
        </h1>
       <jsp:useBean id="miLibro" scope="request" class="com.emergentes.modelo.Libro"/> 
       <form action="Controller" method="post">
            
                
                    <label>Id</label>
                    <input type="text" name="id"
                               value="<jsp:getProperty name="miLibro" property="id" />">         
                    
                    <br>
                    <br>
                    <label>Titulo: </label>
                    <input type="text" name="titulo"
                               value="<jsp:getProperty name="miLibro" property="titulo" />">
                               
                    
                    <br>
                    <br>
                    <label>Autor: </label>
                    <input type="text" name="autor"
                               value="<jsp:getProperty name="miLibro" property="autor" />">
                               
                    
                    <br>
                    <br>
                    <label>Resumen: </label>
                    <br>
                    <input  type="text" name="resumen"
                            value="<jsp:getProperty name="miLibro" property="resumen" />">
                    
                           
                    <br>
                    <label>Medio: </label>
                    <br>
                        
                    <input name="medio" type ="radio" value="Fisico" 
                                    <c:if test="${miLibro.medio == 'Fisico'}"
                                          var="res" scope="request">
                                        
                                    </c:if>
                                
                                        /><label>Fisico</label>
                    <br>
                      <input name="medio" type ="radio" value="Magnetico" 
                                    <c:if test="${miLibro.medio == 'Magnetico'}"
                                          var="res" scope="request">
                                        
                                    </c:if>
                                
                                        /><label>Magnetico</label>
                
                        <br>
                        <br>
                        <input type="hidden" name="opg" value="${requestScope.op}"/>
                        <input type="hidden" name="op" value="grabar"/>
                    
                    <input type="submit" value="Enviar">
                
            
    </body>
</html>
