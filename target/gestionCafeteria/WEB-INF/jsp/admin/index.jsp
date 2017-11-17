<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Admin</title>
<!-- Bootstrap core CSS-->
<!-- Bootstrap core CSS-->
<link
	href="<spring:url  value="/resources/vendor/bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="<spring:url  value="/resources/vendor/font-awesome/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link
	href="<spring:url  value="/resources/vendor/datatables/dataTables.bootstrap4.css" />"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<spring:url  value="/resources/css/sb-admin.css" />"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<script src="<spring:url value="/resources/js/vis.min.js" />"></script>
<link href="<spring:url value="/resources/css/vis.min.css" />"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="<c:url value="/index" />">Gestion
			Cafeteria</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">

				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link"
					href="<c:url value="/admin/users" />"> <i
						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">Gerer
							Utilisateurs</span>
				</a></li>

				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link"
					href="<c:url value="/admin/index" />"> <i
						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">Gerer
							Plats</span>
				</a></li>
				<!-- 				<li class="nav-item" data-toggle="tooltip" data-placement="right" -->
				<!-- 					title="Dashboard"><a class="nav-link" -->
				<%-- 					href="<c:url value="/admin/personnels" />"> <i --%>
				<!-- 						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">Gerer -->
				<!-- 							Personnels</span> -->
				<!-- 				</a></li> -->
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts"><a class="nav-link"
					href="<c:url value="/admin/clients" />"> <i
						class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Gerer
							Clients</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts"><a class="nav-link"
					href="<c:url value="/admin/cartes" />"> <i
						class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Gerer
							Cartes</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts"><a class="nav-link"
					href="<c:url value="/index" />"> <i
						class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Accueil</span>
				</a></li>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"></i>Deconnexion
				</a></li>
			</ul>
		</div>
	</nav>
	<div class="content-wrapper">
		<div class="container-fluid"></div>
		<div id="visualization"></div>
		<!-- Button to Open the Modal -->

		<hr />
		<div style="text-align: center;">
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#ajoutModal">Ajouter Plat</button>
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#modifierModal">Modifier Plat</button>
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#supprimerModal">Supprimer Plat</button>
		</div>
		<hr />

		<!-- The Modal -->
		<div class="modal fade" id="ajoutModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Ajouter Plat</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form method="GET" name="ajouterPlat"
							action="<c:url value="/admin/ajouter-plat" />">
							<div class="form-group">
								<label for="nom">Nom:</label> <input type="text"
									class="form-control" id="nom" name="nom">
							</div>
							<div class="form-group">
								<label for="description">Description:</label> <input type="text"
									class="form-control" id="description" name="description">
							</div>
							<div class="form-group">
								<label for="date_debut">Date debut:</label> <input type="date"
									class="form-control" id="date_debut" name="date_debut">
							</div>
							<div class="form-group">
								<label for="date_fin">Date fin:</label> <input type="date"
									class="form-control" id="date_fin" name="date_fin">
							</div>
							<button type="submit" class="btn btn-primary">Ajouter</button>
						</form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Fermer</button>
					</div>

				</div>
			</div>
		</div>

		<div class="modal fade" id="modifierModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Modifier Plat</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form method="GET" name="modifierPlat"
							action="<c:url value="/admin/modifier-plat" />" id="modifier-form">
							<div class="form-group">
								<label for="id">ID:</label> <input type="number" min="1"
									step="1" class="form-control" id="modifier_id" name="id">
							</div>
							<div class="form-group">
								<label for="modifier_nom">Nom:</label> <input type="text"
									class="form-control"  name="nom" id="modifier_nom">
							</div>
							<div class="form-group">
								<label for="modifier_description">Description:</label> <input type="text"
									class="form-control"  name="description" id="modifier_description">
							</div>
							<div class="form-group">
								<label for="modifier_date_debut">Date debut:</label> <input type="date"
									class="form-control"  name="date_debut" id="modifier_date_debut">
							</div>
							<div class="form-group">
								<label for="modifier_date_fin">Date fin:</label> <input type="date"
									class="form-control" name="date_fin" id="modifier_date_fin">
							</div>
							<button type="submit" class="btn btn-primary">Modifier</button>
						</form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Fermer</button>
					</div>

				</div>
			</div>
		</div>

		<div class="modal fade" id="supprimerModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Supprimer Plat</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form method="GET" name="supprimerPlat"
							action="<c:url value="/admin/supprimer-plat" />">
							<div class="form-group">
								<label for="id_plat">ID Plat:</label> <input type="number"
									min="1" step="1" class="form-control" id="id_plat"
									name="id_plat">
							</div>
							<input type="submit" class="btn btn-danger" value="Supprimer">
						</form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Fermer</button>
					</div>

				</div>
			</div>
		</div>

		<!-- Example DataTables Card-->
		<div class="card mb-3">
			<div class="card-header">
				<i class="fa fa-table"></i>Liste Plats
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>ID</th>
								<th>NOM PLAT</th>
								<th>DESCRIPTION</th>
								<th>DATE DEBUT</th>
								<th>DATE FIN</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>ID</th>
								<th>NOM PLAT</th>
								<th>DESCRIPTION</th>
								<th>DATE DEBUT</th>
								<th>DATE FIN</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${listePlats}" var="plat">
								<tr>
									<td>${plat.id}</td>
									<td>${plat.nomPlat}</td>
									<td>${plat.description}</td>
									<td>${plat.startDate}</td>
									<td>${plat.endDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container-fluid-->
	<!-- /.content-wrapper-->
	<footer class="sticky-footer">
		<div class="container">
			<div class="text-center">
				<small>Gestion Cafeteria 2017</small>
			</div>
		</div>
	</footer>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Voulez-vous
						vous deconnecter ?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Cliquez sur "Deconnexion" si vous
					voulez fermer votre session</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Annuler</button>
					<a class="btn btn-primary" href="<c:url value="/logout" />">Deconnexion</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script
		src="<spring:url  value="/resources/vendor/jquery/jquery.min.js"/>"></script>
	<script
		src="<spring:url  value="/resources/vendor/popper/popper.min.js"/>"></script>
	<script
		src="<spring:url  value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="<spring:url  value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>
	<!-- Page level plugin JavaScript-->
	<script
		src="<spring:url  value="/resources/vendor/chart.js/Chart.min.js"/>"></script>
	<script
		src="<spring:url  value="/resources/vendor/datatables/jquery.dataTables.js"/>"></script>
	<script
		src="<spring:url  value="/resources/vendor/datatables/dataTables.bootstrap4.js"/>"></script>
	<!-- Custom scripts for all pages-->
	<script src="<spring:url  value="/resources/js/sb-admin.min.js"/>"></script>
	<!-- Custom scripts for this page-->
	<script
		src="<spring:url  value="/resources/js/sb-admin-datatables.min.js" />"></script>
	<script
		src="<spring:url  value="/resources/js/sb-admin-charts.min.js" />"></script>
	<script type="text/javascript">
			// DOM element where the Timeline will be attached
			var container = document.getElementById('visualization');
						
			// Create a DataSet (allows two way data-binding)
			var items = new vis.DataSet([
				<c:forEach items="${listePlats}" var="plat" varStatus="status">			
					{		
		 			    id : ${plat.id},		 			    
		 			    content : '${plat.nomPlat}',
		 			    start : '${plat.startDate}'
						<c:if test="${not empty plat.endDate}">
		 			    	, 
		 			    	end: '${plat.endDate}'
						</c:if>
		 		    }
					<c:if test="${!status.last}">
						,
					</c:if>
	 			</c:forEach>		
			]);	
			// Configuration for the Timeline
			var options = {};	
			// Create a Timeline
			var timeline = new vis.Timeline(container, items, options);
		</script>
		<script>		
		
		function getFormattedDate(date) {
		    var month = date.getMonth() + 1;
		    var day = date.getDate();
		    var year = date.getFullYear();
		    return year + "-" + month + "-" + day;
		}
		
			$("#modifier_id").keyup(function (e) {
				e.preventDefault();     
				e.stopPropagation();
				
				var num = $('#modifier_id').val();
				
				$.ajax({
		            url : 'http://localhost:8080/gestionCafeteria/admin/recupererPlat',
		            type: 'get',
		            data: 'numero='+num,
		            dataType: "json",
		            success : function(json) {
		                $('#modifier_nom').val(json.nomPlat);
		                $('#modifier_description').val(json.description);
		                $('#modifier_date_debut').val(getFormattedDate(new Date(json.startDate)));
		                $('#modifier_date_fin').val(getFormattedDate(new Date(json.endDate)));
		            },
		            error: function(request, textStatus, errorThrown) {
		             	//alert(errorThrown);
		             	console.log(errorThrown);
		            }
		        });
		    });
	</script>

	<script>
			$(function() {
				$('#action').click(function() {
					var param = 'l=' + $('#ref').val();
					$('#r').load('http://www.proverbes.php',param);
				});
			});
		</script>
	</div>
</body>

</html>