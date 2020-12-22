<%@page import="entities.TypeConvention"%>
<%@page import="entities.ParticipantConvention"%>
<%@page import="dao.Metier.IParticipantConvention"%>
<%@page import="entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Participant"%>
<%@page import="java.util.List"%>
<%@page import="entities.Convention"%>
<%@page import="entities.Participant"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	HttpSession sessions = request.getSession();
%>
<%
	if (sessions.getAttribute("login") == null && sessions.getAttribute("password") == null) {

		request.getRequestDispatcher("User.jsp").forward(request, response);
	}
%>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>




<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Gestion de convention</title>
<script type="text/javascript"
	src="https://cdn.zingchart.com/zingchart.min.js"></script>
<script type="text/javascript" src="assets/js/zingchart.min.js"></script>

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
<jsp:useBean id="conv" class="dao.ConventionImp" scope="session"></jsp:useBean>
<jsp:useBean id="par" class="dao.ParticipantImp" scope="session"></jsp:useBean>
<jsp:useBean id="convPar" class="dao.ParticipantConventionImp" scope="session"></jsp:useBean>
<jsp:useBean id="typee" class="dao.TypeConventionImp" scope="session"></jsp:useBean>


<%
	Gson gsonObj = new Gson();
	Map<Object, Object> map = null;
	List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
	

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	final String host = "jdbc:mysql://localhost/" + "convocation_bd";
	final Connection conn = DriverManager.getConnection(host, "root", "");
	final Statement stmt = conn.createStatement();
String rsql="select count(*) as x,p.libelle as y from convention c,participant p,participantconvention pc where c.id=pc.convention_id AND pc.participant_id=p.id GROUP by p.libelle";
	final ResultSet rs = stmt.executeQuery(rsql);
			//"select count(*) as x,t.libelle as y from convention c,typeconvention t where c.typeConventions_id=t.id group by t.libelle;");
	//nombre  de chaque type par convention
			while (rs.next()) {
		map = new HashMap<Object,Object>(); 
		map.put("label",rs.getString("y")); 
		map.put("y",rs.getString("x")); 
		list.add(map);

	}
	
	
	String dataPoints = gsonObj.toJson(list);
%>



<script type="text/javascript">
	window.onload = function() {

		var chart = new CanvasJS.Chart("chartContainer", {
			theme : "light2", // "light1", "dark1", "dark2"
			exportEnabled : true,
			animationEnabled : true,
			title : {
				text : "Nombre de participants par Convention"
			},
			data : [ {
				type : "pie",
				toolTipContent : "<b>{label}</b>: {y}",
				indexLabelFontSize : 16,
				indexLabel : "{label} - {y}",
				dataPoints :
<%out.print(dataPoints);%>
	} ]
		});
		chart.render();

	}
</script>

</head>
<body>



	<!-- Begin page -->
	<div id="wrapper">

		<!-- Topbar Start -->
		<div class="navbar-custom">
			<ul class="list-unstyled topnav-menu float-right mb-0">

				<!--    <li class="d-none d-sm-block">
                        <form class="app-search">
                            <div class="app-search-box">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <div class="input-group-append">
                                        <button class="btn" type="submit">
                                            <i class="fe-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </li> -->

				<li class="dropdown notification-list">
					<!-- <a class="nav-link dropdown-toggle  waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <i class="fe-bell noti-icon"></i>
                            <span class="badge badge-danger rounded-circle noti-icon-badge">9</span>
                        </a> -->
					<div class="dropdown-menu dropdown-menu-right dropdown-lg">

						<!-- item-->
						<div class="dropdown-item noti-title">
							<h5 class="m-0">
								<span class="float-right"> <a href="" class="text-dark">
										<small>Clear All</small>
								</a>
								</span>Notification
							</h5>
						</div>

						<div class="slimscroll noti-scroll">

							<!-- item-->
							<a href="javascript:void(0);"
								class="dropdown-item notify-item active">
								<div class="notify-icon">
									<img src="assets/images/users/user-1.jpg"
										class="img-fluid rounded-circle" alt="" />
								</div>
								<p class="notify-details">Cristina Pride</p>
								<p class="text-muted mb-0 user-msg">
									<small>Hi, How are you? What about our next meeting</small>
								</p>
							</a>


						</div>


					</div>
				</li>

				<li class="dropdown notification-list"><a
					class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light"
					data-toggle="dropdown" href="#" role="button" aria-haspopup="false"
					aria-expanded="false"> <img src="assets/images/firas.jpg"
						alt="user-image" class="rounded-circle"> <span
						class="pro-user-name ml-1"> <%=sessions.getAttribute("name")%>
							<i class="mdi mdi-chevron-down"></i>
					</span>
				</a>
					<div class="dropdown-menu dropdown-menu-right profile-dropdown ">
						<!-- item-->
						<div class="dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome !</h6>
						</div>


						<a href="../../LogOut" class="dropdown-item notify-item"> <i
							class="fe-log-out"></i> <span>Logout</span>
						</a>


					</div></li>



			</ul>

			<!-- LOGO -->
			<div class="logo-box">
				<a href="index.html" class="logo text-center"> <span
					class="logo-lg"> <img src="assets/images/convention.png"
						alt="" height="60"> <!-- <span class="logo-lg-text-light">UBold</span> -->
				</span> <span class="logo-sm"> <!-- <span class="logo-sm-text-dark">U</span> -->
						<img src="assets/images/convention.png" alt="" height="30">
				</span>
				</a>
			</div>


		</div>
		<!-- end Topbar -->

		<!-- ========== Left Sidebar Start ========== -->
		<div class="left-side-menu">

			<div class="slimscroll-menu">

				<!--- Sidemenu -->
				<div id="sidebar-menu">

					<ul class="metismenu" id="side-menu">

						<li class="menu-title">Gestion de convention</li>

						<li><a href="javascript: void(0);"> <i class="fe-pocket"></i>
								<span> Type de Convention </span> <span class="menu-arrow"></span>
						</a>
							<ul class="nav-second-level" aria-expanded="false">
								<li><a href="../TypeConventionServlet">Ajouter type de
										convention</a></li>

							</ul></li>
						<li><a href="javascript: void(0);"> <i class="fe-pocket"></i>
								<span> Participants </span> <span class="menu-arrow"></span>
						</a>
							<ul class="nav-second-level" aria-expanded="false">
								<li><a href="ParticipantServlet">Ajouter participant</a></li>
							</ul></li>
						<li><a href="javascript: void(0);"> <i class="fe-pocket"></i>
								<span> Conventions </span> <span class="menu-arrow"></span>
						</a>
							<ul class="nav-second-level" aria-expanded="false">
								<li><a href="ConventionServlet">Ajouter Convention</a></li>
								<li><a href="ParticipantConventionServlet">Liste des
										conventions</a></li>

							</ul></li>





					</ul>

				</div>
				<!-- End Sidebar -->

				<div class="clearfix"></div>

			</div>
			<!-- Sidebar -left -->

		</div>
		<!-- Left Sidebar End -->

		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->

		<div class="content-page">
			<div class="content">

				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right"></div>
								<h4 class="page-title">Dashboard</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->
					<%
						List<Convention> c = conv.getAllConvention();
						int CountConv = c.size();
					%>

					<%
						List<Participant> p = par.getAllParticipant();
						int CountPart = p.size();
					%>
					<div class="row">


						<div class="col-md-6 col-xl-3">
							<div class="card-box">
								<div class="row">
									<div class="col-6">
										<div>
											<img alt="" src="assets/images/convention.png" height="40">

										</div>
									</div>
									<div class="col-6">
										<div class="text-right">

											<h3 class="text-dark my-1">
												<span data-plugin="counterup"><%=CountConv%> </span>
											</h3>
										</div>
									</div>
								</div>
								<div class="mt-3">
									<h6 class="text-uppercase">Nombre des Conventions</h6>

								</div>
							</div>
							<!-- end card-box-->
						</div>
						<!-- end col -->


						<div class="col-md-6 col-xl-3">
							<div class="card-box">
								<div class="row">
									<div class="col-6">
										<div>
											<!-- <i class="fe-aperture avatar-title font-22 text-white"></i> -->
											<img alt="" src="assets/images/participant.png" height="40">
										</div>
									</div>
									<div class="col-6">
										<div class="text-right">

											<h3 class="text-dark my-1">
												<span data-plugin="counterup"><%=CountPart%> </span>
											</h3>
										</div>
									</div>
								</div>
								<div class="mt-3">
									<h6 class="text-uppercase">Nombre des Participants</h6>

								</div>
							</div>
							<!-- end card-box-->
						</div>
						<!-- end col -->



					</div>

					<div class="row">
						<div class="col-6">

<div class="col-lg-6">
							<div id="chartContainer" style="height: 370px; width: 100%;"></div>
							<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

							<!-- end card-->
						</div>
						</div>

						
						<!-- end col -->


					</div>







				</div>
				<!-- container -->

			</div>
			<!-- content -->

			<!-- Footer Start -->
			<footer class="footer">
				<div class="container-fluid">
					<div class="row"></div>
				</div>
			</footer>
			<!-- end Footer -->

		</div>

		<!-- ============================================================== -->
		<!-- End Page content -->
		<!-- ============================================================== -->


	</div>
	<!-- END wrapper -->

	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>

	<!-- Vendor js -->
	<script src="assets/js/vendor.min.js"></script>

	<!-- Plugins js-->
	<script src="assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="assets/libs/jquery-knob/jquery.knob.min.js"></script>
	<script src="assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
	<script src="assets/libs/flot-charts/jquery.flot.js"></script>
	<script src="assets/libs/flot-charts/jquery.flot.time.js"></script>
	<script src="assets/libs/flot-charts/jquery.flot.tooltip.min.js"></script>
	<script src="assets/libs/flot-charts/jquery.flot.selection.js"></script>
	<script src="assets/libs/flot-charts/jquery.flot.crosshair.js"></script>

	<!-- Dashboar 1 init js-->
	<script src="assets/js/pages/dashboard-1.init.js"></script>

	<!-- App js-->
	<script src="assets/js/app.min.js"></script>





	<script src="assets/libs/chart-js/Chart.bundle.min.js"></script>



</body>
</html>