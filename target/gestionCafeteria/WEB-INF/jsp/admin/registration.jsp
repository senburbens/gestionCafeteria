<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Registration Form</title>
	<link href="<c:url value='/resources/css/bootstrap.css' />"
		rel="stylesheet"></link>
<%-- 	<link href="<c:url value='/resources/css/app.css' />" rel="stylesheet"></link> --%>
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
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Users List</title>
	<link href="<c:url value='/resources/css/bootstrap.css' />"
		rel="stylesheet"></link>
<%-- 	<link href="<c:url value='/resources/css/app.css' />" rel="stylesheet"></link> --%>
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
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts"><a class="nav-link"
					href="<c:url value="/login" />"> <i
						class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Page
							de connexion</span>
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
		<!-- Button to Open the Modal -->

		<!-- Example DataTables Card-->
		<div class="generic-container">
			<%@include file="authheader.jsp"%>
			<div class="well lead">Formulaire d'enregistrement</div>
			<form:form method="POST" modelAttribute="user"
				class="form-horizontal">
				<form:input type="hidden" path="id" id="id" />

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="firstName">Prenom
							</label>
						<div class="col-md-7">
							<form:input type="text" path="firstName" id="firstName"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="firstName" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="lastName">
							Nom</label>
						<div class="col-md-7">
							<form:input type="text" path="lastName" id="lastName"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="lastName" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="ssoId">nom d'utilisateur</label>
						<div class="col-md-7">
							<c:choose>
								<c:when test="${edit}">
									<form:input type="text" path="ssoId" id="ssoId"
										class="form-control input-sm" disabled="true" />
								</c:when>
								<c:otherwise>
									<form:input type="text" path="ssoId" id="ssoId"
										class="form-control input-sm" />
									<div class="has-error">
										<form:errors path="ssoId" class="help-inline" />
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="password">Mot de passe</label>
						<div class="col-md-7">
							<form:input type="password" path="password" id="password"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="password" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="email">Email</label>
						<div class="col-md-7">
							<form:input type="text" path="email" id="email"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="email" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="userProfiles">Roles</label>
						<div class="col-md-7">
							<form:select path="userProfiles" items="${roles}" multiple="true"
								itemValue="id" itemLabel="type" class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="userProfiles" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-actions floatRight">
						<c:choose>
							<c:when test="${edit}">
								<input type="submit" value="Modifier"
									class="btn btn-primary btn-sm" /> or <a
									href="<c:url value='/admin/users' />">Annuler</a>
							</c:when>
							<c:otherwise>
								<input type="submit" value="Enregistrer"
									class="btn btn-primary btn-sm" /> or <a
									href="<c:url value='/admin/users' />">Annuler</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</form:form>
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
							<span aria-hidden="true">�</span>
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

	</div>
</body>

</html>