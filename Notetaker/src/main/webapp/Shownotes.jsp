<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All notes are here!!!</title>
<%@include file="all_css_js.jsp"%>

</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All notes</h1>

		<div class="row">
			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("From Notetaker");
				List<Notetaker> list = q.list();
				for (Notetaker note : list) {
				%>
				<div class="card mt-3">
					<img class="card-img-top m-3" style="max-width:100px" src="img/notepad.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle() %></h5>
						<p class="card-text">
						<%=note.getContent() %></p>
						<p><b><%=note.getAddDate() %></b></p>
						<div class="container text-center">
						<a href="DeleteServlet?note_id=<%= note.getId()  %>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>


				<%
				}
				s.close();
				%>




			</div>

		</div>


	</div>
</body>
</html>