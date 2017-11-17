<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="author" content="">
		<title>Gestion de Cafeteria</title>
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Custom fonts for this template -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
			rel="stylesheet" type="text/css">		
		<script src="<spring:url value="/resources/js/vis.min.js" />"></script>
		<link href="<spring:url value="/resources/css/vis.min.css" />"
			rel="stylesheet" type="text/css" />		
		<style>
			img {
				width: 843px;
			}	
			.item {
				text-align: center;
			}	
			footer {
				margin-top: 20px;
			}
			nav{
				margin-bottom : 0px;
			}
			.container{
				margin-top:0px;
			}
			  .vis.timeline .item {
    border-color: orange;
    background-color: yellow;
  }
			
		</style>	
	</head>
	<body>
		<div
			class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">Gestion
			de Cafeteria</div>
		<div
			class="tagline-lower text-center text-expanded text-shadow text-uppercase text-white mb-5 d-none d-lg-block">Adresse
			Ky Tuc Xa My Dinh, 123213413</div>
		<br />
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Gestion de Cafeteria</a>
				</div>
				<ul class="nav navbar-nav">
					<!-- 				<li class="active"><a href="#">Accueil</a></li> -->
					<!-- 				<li><a href="#">A propos</a></li> -->
					<!-- 				<li><a href="#">Blog</a></li> -->
					<!-- 				<li><a href="#">Contact</a></li> -->
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Se Connecter</a></li>
				</ul>
			</div>
		</nav>
	
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
	
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<p>
									<img class="img-rounded"
										src="<spring:url value="/resources/img/slide-1.jpg" />" alt="">
								</p>
							</div>
	
							<div class="item">
								<p>
									<img class="img-rounded"
										src="<spring:url value="/resources/img/slide-2.jpg" />" alt="">
								</p>
							</div>
	
							<div class="item">
								<p>
									<img class="img-rounded"
										src="<spring:url value="/resources/img/slide-3.jpg" />" alt="">
								</p>
							</div>
						</div>
	
						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Precedent</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Suivant</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!--. /container -->	
		<br />
		<br />
		
		<hr />
		<div id="visualization"></div>
		<hr />
		<table class="table .table-hover">
			<thead>
		      <tr>
		        <th>ID</th>
		        <th>NOM PLAT</th>
		        <th>DESCRIPTION</th>
		        <th>DATE DEBUT</th>
		        <th>DATE FIN</th>
		      </tr>
		    </thead>
		    <tbody>
				<c:forEach items="${listePlats}" var="plat">
					<tr>			
					    <td style="background-color:red"><c:out value="${plat.id}" /></td>
					    <td><c:out value="${plat.nomPlat}" /></td>
					    <td><c:out value="${plat.description}" /></td>
					    <td><c:out value="${plat.startDate}"/></td>
					    <td><c:out value="${plat.endDate}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
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
	
		<footer>
			<div class="container">
				<p style="text-align: center">Copyright &copy; Gestion de Cafeteria 2017</p>
			</div>
		</footer>
	
		<!-- Bootstrap core JavaScript -->
		<!-- jQuery library -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!-- Latest compiled JavaScript -->
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>
