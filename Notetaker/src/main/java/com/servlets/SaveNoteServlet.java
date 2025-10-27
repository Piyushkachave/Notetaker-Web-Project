package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notetaker;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SaveNoteServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//title,content fetch
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			Notetaker note=new Notetaker(title, content, new Date());
			//hibernate save
			Session session=FactoryProvider.getFactory().openSession();
			
			Transaction tx=session.beginTransaction();
			session.persist(note);
			tx.commit();
			session.close();
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<h1>Note is added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='Shownotes.jsp'>View all notes</a></h1>");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
