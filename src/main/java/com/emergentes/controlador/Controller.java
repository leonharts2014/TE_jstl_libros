
package com.emergentes.controlador;

import com.emergentes.modelo.GestorLibros;
import com.emergentes.modelo.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Libro objLibro = new Libro ();
       int id;
       int pos;
       String opcion = request.getParameter("op");
       String op = (opcion != null) ? request.getParameter("op"):"view";
       
       if (op.equals("nuevo")){
           HttpSession ses = request.getSession();
           GestorLibros redaccion = (GestorLibros) ses.getAttribute("redaccion");
           objLibro.setId(redaccion.obtieneId());
           request.setAttribute("op", op);
           request.setAttribute("miLibro", objLibro);
           request.getRequestDispatcher("editar.jsp").forward(request, response);
       
       }
       if(op.equals("modificar")){
           id = Integer.parseInt(request.getParameter("id"));
           HttpSession ses = request.getSession();
           GestorLibros redaccion = (GestorLibros) ses.getAttribute("redaccion");
           pos = redaccion.ubicarLibro(id);
           objLibro = redaccion.getLista().get(pos);
           
           request.setAttribute("op", op);
           request.setAttribute("miLibro", objLibro);
           request.getRequestDispatcher("editar.jsp").forward(request, response);
       }
       if(op.equals("eliminar")){
           id = Integer.parseInt(request.getParameter("id"));
           HttpSession ses = request.getSession();
           GestorLibros redaccion = (GestorLibros) ses.getAttribute("redaccion");
           pos = redaccion.ubicarLibro(id);
           redaccion.eliminarLibro(pos);
           ses.setAttribute("redaccion", redaccion);
           response.sendRedirect("index.jsp");
       }
       if(op.equals("view")){
           response.sendRedirect("index.jsp");
       }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Libro objLibro = new Libro();
        int pos;
        String op = request.getParameter("op");
        
        if(op.equals("grabar")){
            //Recuperar valores del formulario
            //Verificar si es nuevo o es una modificacion
            objLibro.setId(Integer.parseInt(request.getParameter("id")));
            objLibro.setTitulo(request.getParameter("titulo"));
            objLibro.setAutor(request.getParameter("autor"));
            objLibro.setResumen(request.getParameter("resumen"));
            objLibro.setMedio(request.getParameter("medio"));
            HttpSession ses = request.getSession();
            GestorLibros redaccion = (GestorLibros) ses.getAttribute("redaccion");
            
            String opg = request.getParameter("opg");
            if(opg.equals("nuevo")){
                redaccion.insertarLibro(objLibro);
            }
            else{
                pos = redaccion.ubicarLibro(objLibro.getId());
                redaccion.modificarLibro(pos, objLibro);
            }
            ses.setAttribute("redaccion", redaccion);
            response.sendRedirect("index.jsp");
        }   
    }

   
  
}
