<%@page import="entities.Convention"%>
<%@page import="entities.ParticipantConvention"%>
<%@page import="java.util.List"%>
<%@page import="dao.ParticipantConventionImp"%>
<%@page import="dao.Metier.IParticipantConvention"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.TypeConvention"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8" />
<title>Listes des conventions</title>
<link href="views/assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="views/assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="views/assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="views/assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- App favicon -->
<link rel="shortcut icon" href="views/assets/images/favicon.ico">

<!-- Plugins css -->
<link href="views/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet"
	type="text/css" />

<!-- App css -->
<link href="views/assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="views/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="views/assets/css/app.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function confirmation(id) {
		var conf = confirm("Etes vous sure de vouloir supprimer");
		if (conf == true) {
			document.location = "ConventionServlet?action=supprimer&id=" + id;
		}
	}
</script>
<jsp:useBean id="conv" class="dao.ConventionImp" scope="session"></jsp:useBean>
<jsp:useBean id="pars" class="dao.ParticipantConventionImp" scope="session"></jsp:useBean>

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
									<img src="views/assets/images/users/user-1.jpg"
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
					aria-expanded="false"> <img
						src="views/assets/images/firas.jpg" alt="user-image"
						class="rounded-circle"> <span class="pro-user-name ml-1">
							Firas <i class="mdi mdi-chevron-down"></i>
					</span>
				</a>
					<div class="dropdown-menu dropdown-menu-right profile-dropdown ">
						<!-- item-->
						<div class="dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome !</h6>
						</div>

						<!-- item-->
						<a href="javascript:void(0);" class="dropdown-item notify-item">
							<i class="fe-user"></i> <span>My Account</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);" class="dropdown-item notify-item">
							<i class="fe-settings"></i> <span>Settings</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);" class="dropdown-item notify-item">
							<i class="fe-lock"></i> <span>Lock Screen</span>
						</a>

						<div class="dropdown-divider"></div>

						<!-- item-->
	<a href="../LogOut" class="dropdown-item notify-item"> <i
							class="fe-log-out"></i> <span>Logout</span>
						</a>


					</div></li>



			</ul>

			<!-- LOGO -->
			<div class="logo-box">
				<a href="index.jsp" class="logo text-center"> <span
					class="logo-lg"> <img src="views/assets/images/convention.png"
						alt="" height="60"> <!-- <span class="logo-lg-text-light">UBold</span> -->
				</span> <span class="logo-sm"> <!-- <span class="logo-sm-text-dark">U</span> -->
						<img src="views/assets/images/convention.png" alt="" height="30">
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
								<li><a href="TypeConventionServlet">Ajouter type de
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
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<div class="form-inline">
										
										
									</div>
								</div>
								<h4 class="page-title">Listes des conventions</h4>
							</div>
						</div>
					</div>
					<div class="row">
<script>
$(document).ready(function() {
    $('#basic-datatable').DataTable();
} );
</script>
						<div class="col-12">
							<div class="table-responsive">
										
							
								<table border="1" WIDTH=100% id="basic-datatable" class="table dt-responsive nowrap">

									<thead>
										<tr
											style="text-align: center !important; vertical-align: middle !important;">
											<th class="text-center">Numro</th>
											<th class="text-center">Type</th>
											<th class="text-center">Participants</th>
											<th class="text-center">Date d'dition</th>
											<th class="text-center">Objet</th>
											<th class="text-center">Date d'entre en vigueur</th>
											<th class="text-center">Date d'expiration</th>
												<th style="width: 85px;" class="text-center">Action</th>
										</tr>
									</thead>
									
									<%List<Convention>c=conv.getAllConvention(); 
											for(Convention p :c){	%>
									
										<tr>

											<td><%=p.getId()%></td>
											<td><%=p.getTypeConvention().getLibelle()%></td>
											<td>
											<%List<ParticipantConvention>pc=pars.getAllConvntionParticipantParParticipant(p.getId()+""); 
											for(ParticipantConvention po:pc){
											%>
											<%if(po.getDatesignature()!=null)
												out.print(po.getParticipant().getLibelle()+ " Date: " +po.getDatesignature()+"<br>");
												else out.print(po.getParticipant().getLibelle());%>
											<%} %>
											</td>					
											<td><%=p.getDateEdition()%></td>
											<td><%=p.getObjet()%></td>
											<td><%=p.getDateEntre()%></td>
											<td><%=p.getDateExpiration()%></td>
											
											
											<td><a
														href="ConventionServlet?action=modifierConvention&id=<%=p.getId()%>"
														class="action-icon"> <i
															class="mdi mdi-square-edit-outline"></i></a> <a
														href="javascript:confirmation(<%=p.getId()%>)"
														class="action-icon"> <i class="mdi mdi-delete"></i></a>
														
														<a href="views/Reporting.jsp?action=imprimer&id=<%=p.getId()%>" class="action-icon"> 
														<i class="mdi mdi-printer"></i></a>
											</td>
										</tr>
									<%} %>
								</table>
							</div>
						</div>
					</div>

				</div>
				</form>
				<!-- container -->

			</div>
			<!-- content -->

			<!-- Footer Start -->
			<footer class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							2015 - 2019 &copy; UBold theme by <a href="">Coderthemes</a>
						</div>
						<div class="col-md-6">
							<div class="text-md-right footer-links d-none d-sm-block">
								<a href="javascript:void(0);">About Us</a> <a
									href="javascript:void(0);">Help</a> <a
									href="javascript:void(0);">Contact Us</a>
							</div>
						</div>
					</div>
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
	<script src="views/assets/js/vendor.min.js"></script>

	<!-- Plugins js-->
	<script src="views/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="views/assets/libs/jquery-knob/jquery.knob.min.js"></script>
	<script src="views/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
	<script src="views/assets/libs/flot-charts/jquery.flot.js"></script>
	<script src="views/assets/libs/flot-charts/jquery.flot.time.js"></script>
	<script src="views/assets/libs/flot-charts/jquery.flot.tooltip.min.js"></script>
	<script src="views/assets/libs/flot-charts/jquery.flot.selection.js"></script>
	<script src="views/assets/libs/flot-charts/jquery.flot.crosshair.js"></script>

	<!-- Dashboar 1 init js-->
	<script src="views/assets/js/pages/dashboard-1.init.js"></script>

        <script src="views/assets/libs/datatables/jquery.dataTables.min.js"></script>
        <script src="views/assets/libs/datatables/dataTables.bootstrap4.js"></script>
        <script src="views/assets/libs/datatables/dataTables.responsive.min.js"></script>
        <script src="views/assets/libs/datatables/responsive.bootstrap4.min.js"></script>
        <script src="views/assets/libs/datatables/dataTables.buttons.min.js"></script>
        <script src="views/assets/libs/datatables/buttons.bootstrap4.min.js"></script>
        <script src="views/assets/libs/datatables/buttons.html5.min.js"></script>
        <script src="views/assets/libs/datatables/buttons.flash.min.js"></script>
        <script src="views/assets/libs/datatables/buttons.print.min.js"></script>
        <script src="views/assets/libs/datatables/dataTables.keyTable.min.js"></script>
        <script src="views/assets/libs/datatables/dataTables.select.min.js"></script>
        <script src="views/assets/libs/pdfmake/pdfmake.min.js"></script>
        <script src="views/assets/libs/pdfmake/vfs_fonts.js"></script>
        <!-- third party js ends -->

        <!-- Datatables init -->
        <script src="views/assets/js/pages/datatables.init.js"></script>

	<!-- App js-->
	<script src="views/assets/js/app.min.js"></script>

</body>
</html>
