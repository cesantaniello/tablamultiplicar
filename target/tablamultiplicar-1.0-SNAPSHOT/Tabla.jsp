<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Tabla de multiplicar</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</head>
<body>

	<div class="container text-center">

		<%
			Boolean dev = false;
			try {
				int alto, ancho;
				alto = Integer.parseInt(request.getParameter("alto"));
				ancho = Integer.parseInt(request.getParameter("ancho"));
				String aux;
				if(alto == 1 || ancho == 1){
					aux = "";
				}else{
					aux = " class=\"table-dark\"";
				}

				if (alto < 1 || alto > 100 || ancho < 1 || ancho > 100) {
					out.print(
							"<div class=\"alert alert-danger\" role=\"alert\">Has utilizado un número inválido</div>");
				} else {
		%>

		<h1>Tabla de Multiplicar</h1>
		<table class="table table-bordered table-hover">
			<tbody>

				<%
					for (int fila = 1; fila <= alto; fila++) {
								out.print("<tr>");
								for (int columna = 1; columna <= ancho; columna++) {
									int res = columna * fila;
									if (fila == 1 || columna == 1) {
										out.print("<td" + aux + ">" + res + "</td>");
									} else {
										out.print("<td>" + res + "</td>");
									}
								}
								out.print("</tr>");
							}
						}
				%>


			</tbody>
		</table>


		<%
			} catch (NumberFormatException e) {
				if (dev) {
					e.printStackTrace();
				} else {
					out.print("<div class=\"alert alert-danger\" role=\"alert\">Ha ocurrido un error</div>");
				}
			} finally {
				out.print("<a class=\"btn btn-primary float-right\" role=\"button\" href=\"/TablaChoose\">Volver</a>");
			}
		%>




	</div>
</body>
</html>