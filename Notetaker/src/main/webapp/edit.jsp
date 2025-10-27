<%@page import="com.entities.Notetaker"%>
<%@page import="com.helper.FactoryProvider,com.helper.*,org.hibernate.*,com.entities.* "%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <%@include file="all_css_js.jsp"%>

</head>
<body>
 <div class="container">
  
  <%@include file="navbar.jsp" %>
    <h1>Edit your note</h1>
    <% 
    int noteId=Integer.parseInt(request.getParameter("note_id").trim());
  	Session s=FactoryProvider.getFactory().openSession();
  	Notetaker note=(Notetaker)s.get(Notetaker.class,noteId);
  
  %>
  <form action="UpdateServlet" method="post">
  <input value="<%=note.getId() %>" name="noteId" type="hidden" />
			<div class="form-group">
				<label for="title">Note title</label> <input required name="title"
					type="text" class="form-control" id="title"
					placeholder="Enter the text here"
					value="<%= note.getTitle() %>"
					;
    aria-describedby="emailHelp">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea required id="content" name="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px;">
					<%=note.getContent() %>
					</textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save your note</button>
			</div>
		</form>
  </div>

</body>
</html>