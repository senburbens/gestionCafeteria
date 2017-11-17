<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Vente - Gestion Cafeteria</title>
<!-- Bootstrap core CSS -->
<link href="<spring:url value="/resources/css/bootstrap.min.css" />" >
<!-- 	rel="stylesheet"> -->
<!-- <!-- Custom styles for this template -->
<link href="<spring:url value="/resources/css/simple-sidebar.css" />"	rel="stylesheet">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<style>
real-content {
	position: relative;
}

ul.nav-pills {
	top: 20px;
	position: fixed;
}

div.col-sm-9 div {
	height: 250px;
	font-size: 28px;
}

#section1 {
	color: #fff;
	background-color: #1E88E5;
}

#section2 {
	color: #fff;
	background-color: #673ab7;
}

#section3 {
	color: #fff;
	background-color: #ff9800;
}

#section41 {
	color: #fff;
	background-color: #00bcd4;
}

#section42 {
	color: #fff;
	background-color: #009688;
}

#left-image{
	width:100%;
	height: 200px;
	margin-bottom:40px;
}

@media screen and (max-width: 810px) {
	#section1, #section2, #section3, #section41, #section42 {
		margin-left: 150px;
	}
}
</style>
</head>

<body>
	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="<c:url value="/index" />">
						Gestion Cafeteria </a></li>
				<li><a href="#" id="gerer-vente">Gerer Vente</a></li>
				<li><a href="<c:url value="/index" />">Acceuil</a></li>
				<li><a href="<c:url value="/logout" />">Deconnexion</a></li>
			</ul>
		</div>


		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<h1>Gestion des Ventes</h1>
				<p>Cette section est consacree a la gestion des ventes de plats</p>
				<a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Afficher
					Menu</a>
			</div>
		</div>

		<div id="real-content" style="display: none;">
			<div class="container">
<!-- 															<img class="img-thumbnail" id="left-image" -->
<%-- 								src="<spring:url value="/resources/img/slide-3.jpg" />" alt=""> --%>
				<div class="row">
					<div class="col-md-3">
						<h2>Transactions</h2>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="#" id="effectuer-vente">Effetuer
									Vente</a></li>
							<li class="nav-item"><a class="nav-link" href="#" id="crediter">Crediter
									solde carte</a></li>
							</li>
						</ul>
					</div>
					<div class="col-md-3">
						<div id="effectuer-vente-section" style="display:none;">
							<div style="text-align:center;padding-top:20%;">
								<button type="button" class="btn btn-primary btn-large">Vendre</button>
							</div>
<!-- 							<form> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label for="numero">Numero carte:</label> <input type="number" -->
<!-- 										min="1" step="1" class="form-control" id="numero" -->
<!-- 										name="numero" required> -->
<!-- 								</div> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label for="montant">Montant</label> <input type="number" -->
<!-- 										min="500" step="1" class="form-control" id="pwd" -->
<!-- 										name="montant" required> -->
<!-- 								</div> -->
<!-- 								<button type="submit" class="btn btn-primary">Crediter</button> -->
<!-- 							</form> -->
						</div>
						<div id="crediter-section" style="display:none">
							<form method="GET" id="crediterForm">
								<div class="form-group">
									<label for="numero">Numero carte:</label> <input type="number"
									min="1" step="1"
										class="form-control" id="numero" name="numero" required>
								</div>
								<div class="form-group">
									<label for="montant">Montant</label> <input type="number"
									min="500" step="1" class="form-control" id="montant" name="montant" required>
								</div>
									<button type="submit" class="btn btn-primary" id="bouton">Crediter</button>
							</form>

						</div>
					</div>
				</div>
				<br /><br />
				<div id="result"></div>
			</div>

		</div>

	</div>

	<script src="<spring:url value="/resources/js/jquery.min.js" />"></script>
	<script src="<spring:url value="/resources/js/bootstrap.bundle.min.js" />"></script>
	<script src="<spring:url value="/resources/js/bootstrap.min.js" />"></script>
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
	<script>
	
		$(function() {
			// Gestion du clic
			$("#gerer-vente").click(function() {
				$('#page-content-wrapper').css('display','none');
				$('#real-content').css('display','block');
			});
			
			$("#effectuer-vente").click(function() {
				$(this).css('display','none');
				$("#crediter").css('display','inline');
				$('#crediter-section').css('display','none');
				$('#effectuer-vente-section').css('display','block');
				$('#result').html('<span></span>')
				$('#numero').html('<span></span>')
				
			});
			
			$("#crediter").click(function() {
				$(this).css('display','none');
				$("#effectuer-vente").css('display','inline');
				$('#effectuer-vente-section').css('display','none');
				$('#crediter-section').css('display','block');
				$('#result').html('<span></span>');
			});
			
			$('#numero').keyup(function(){
				var num = $('#numero').val();
				
				$.ajax({
		            url : "http://localhost:8080/gestionCafeteria/user/recupererCarte",
		            type: "get",
		            //contentType: "application/json",
		            //dataType: "xml",
		            data:'numero='+num,
		            success : function(data) {
		                $('#result').html(data);
		            },
		            error: function(xhr) {
		            }
		        });
			});
			
			
			$("#crediterForm").on("submit", function (e) {
				e.preventDefault();     
				e.stopPropagation();
				
				var num = $('#numero').val();
				var mont = $('#montant').val(); 
				
				$.ajax({
		            url : 'http://localhost:8080/gestionCafeteria/user/crediterCarte',
		            type: 'get',
		            data: 'numero='+num+"&montant="+mont,
		            contentType: "text/html; charset=utf-8",
		            dataType: "text",
		            success : function(data) {
		                $('#result').html(data);
		            },
		            error: function(request, textStatus, errorThrown) {
		            }
		        });
		    });
		});
	</script>
</body>
</html>