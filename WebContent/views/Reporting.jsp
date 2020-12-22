<!DOCTYPE html>
<%@page import="entities.Convention"%>
<%@page import="entities.ParticipantConvention"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
 <meta http-equiv="refresh" content="5; url=index.jsp">
<link media="print" rel="Alternate" href="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Plugins css -->
<link href="assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet"
	type="text/css" />

<!-- App css -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />

</head>
<jsp:useBean id="partiCon" class="dao.ParticipantConventionImp"
	scope="session"></jsp:useBean>
<jsp:useBean id="conv" class="dao.ConventionImp" scope="session"></jsp:useBean>



<body>
	<style>
body {
	color: black;
	font-size: 15px;
	font-family: sans-serif;
	font-weight: bold;
}
</style>
	<!-- Begin page -->
	<div id="wrapper">



		<%
			int id = Integer.parseInt(request.getParameter("id"));
			//List<ParticipantConvention>list=partiCon.getAllConvntionParticipantParParticipant(id);
			Convention c = conv.getConvention(id);
		%>




		<div class="row">
			<div class="col-12">
				<div class="card-box">
					<div class="row">



						<div class="col-md-6">
							<div class="form-group mb-6">
								Identifiant du Convention N°:<%=id%><br> <br>
							</div>

						</div>

						<div class="col-md-6">
							<div class="form-group mb-6">
								Date d'édition :<%=c.getDateEdition()%><br> <br>
							</div>

						</div>

						<div class="col-md-4">
							<div class="form-group mb-6">
								Objet :<%=c.getObjet()%><br> <br>

							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group mb-6">
								Date d'entre en vigueur :<%=c.getDateEntre() %><br> <br>
							</div>
						</div>

						<div class="col-md-4">
							<div class="form-group mb-6">
								La date de son expiration :<%=c.getDateExpiration() %><br> <br>
							</div>
						</div>




					</div>
					<!-- end row -->
				</div>
				<!-- end card-box -->
			</div>
			<!-- end col-->
		</div>


		<%
			int id1 = Integer.parseInt(request.getParameter("id"));
			List<ParticipantConvention> list = partiCon.getAllConvntionParticipantParParticipant(id1 + "");
		%>


		<div class="row">
			<%
				for (ParticipantConvention cp : list) {
			%>

			<div class="col-lg-3">
				<div class="card-box bg-pattern">
					<div class="text-center">
						<img
							src="data:image/jpeg;base64,<%=cp.getParticipant().getLogo()%>"
							width="100px" height="100px" />
						<h4 class="mb-1 font-20">Nom du participant.</h4>
						<p class="text-muted  font-14"><%=cp.getParticipant().getLibelle()%></p>
					</div>

					<p class="font-14 text-center text-muted"><%=cp.getDatesignature() %></p>


				</div>
			</div>
			<%
				}
			%>

		</div>



		<style type="text/css" media="print">
.page {
	-webkit-transform: rotate(-90deg);
	-moz-transform: rotate(-90deg);
	filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
}
</style>

		<style type="text/css">
@media print {
	a[href]:after {
		content: none !important;
	}
}
</style>

		<script type="text/javascript">
			window.print();
		</script>
</body>

</html>