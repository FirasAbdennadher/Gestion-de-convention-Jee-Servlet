<%@page import="java.util.ArrayList"%>
<%@page import="entities.TypeConvention"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	HttpSession sessions = request.getSession();
%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8" />
<link href="views/assets/libs/datatables/dataTables.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<link href="views/assets/libs/datatables/responsive.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<link href="views/assets/libs/datatables/buttons.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<link href="views/assets/libs/datatables/select.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<title>Ajoute Type de convention</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- App favicon -->
<link rel="shortcut icon" href="views/assets/images/favicon.ico">

<!-- Plugins css -->
<link href="views/assets/libs/flatpickr/flatpickr.min.css"
	rel="stylesheet" type="text/css" />

<!-- App css -->
<link href="views/assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="views/assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />
<link href="views/assets/css/app.min.css" rel="stylesheet"
	type="text/css" />

<link href="views/assets/libs/sweetalert2/sweetalert2.min.css"
	rel="stylesheet" type="text/css" />





<script type="text/javascript">
	function confirmation(id) {
		var conf = confirm("Etes vous sure de vouloir supprimer");

		if (conf == true) {
			window.location = "TypeConventionServlet?action=supprimer&id=" + id;
		}

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
									<img src="views/assets/images/firas.jpg"
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
					aria-expanded="false"> <img src="views/assets/images/firas.jpg"
						alt="user-image" class="rounded-circle"> <span
						class="pro-user-name ml-1"> firas <i
							class="mdi mdi-chevron-down"></i>
					</span>
				</a>
					<div class="dropdown-menu dropdown-menu-right profile-dropdown ">
						<!-- item-->
						<div class="dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome !</h6>
						</div>

						
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
					class="logo-lg"> <img
						src="views/assets/images/convention.png" alt="" height="60">
						<!-- <span class="logo-lg-text-light">UBold</span> -->
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
		<button type="button" style="visibility: hidden"
			class="btn btn-info btn-xs" id="sa-error1">Click me</button>

		<script>
			function ValidateForm() {
				var des = document.getElementById('designation').value;
				if (des == "") {
					alert("aaa");

					var button1 = document.querySelector('#sa-error1');
					button1.addEventListener('click', function() {
					});
					button1.click();
					return false;

				}

			}
		</script>
		<div class="content-page">
			<div class="content">

				<!-- Start Content-->
				<div class="container-fluid">
					<form method="post" action=TypeConventionServlet
						onsubmit="return ValidateForm();">
						<!-- start page title -->
						<div class="row">
							<div class="col-12">
								<div class="page-title-box">
									
									<h4 class="page-title">Type de Convention</h4>
								</div>
							</div>
						</div>
						<!-- end page title -->

						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-lg-8">

												<div class="form-group mb-3">
													<label for="simpleinput">Désignation</label> <input
														type='text' name="designation" id="designation"
														value="${type.libelle}" class=" form-control inputtop"
														placeholder=""> <input type="hidden" name="id"
														value="${type.id}" />
												</div>
											</div>


											<div class="col-lg-4">

												<div class="form-group mb-3">
													<c:if test="${type==null}">
														<button type="submit" name="action" value="Ajouter"
															id="sa-success"
															class="btn btn-primary btn-block mt-3 waves-effect waves-light">
															<i class="mdi mdi-plus-circle">Ajouter</i>
														</button>


													</c:if>
													<c:if test="${type!=null}">
														<button type="submit" name="action" value="Modifier"
															id="sa-success"
															class="btn btn-primary btn-block mt-3 waves-effect waves-light">
															<i class="mdi mdi-settings">Modifier</i>
														</button>
													</c:if>

												</div>
											</div>


										</div>
									</div>
								</div>
							</div>
						</div>


					</form>
					<!-- end row-->
					<div class="row">
						<div class="col-12">
							<hr />
							<br /> <br />
						</div>
					</div>
					<script>
						$(document).ready(function() {
							$('#basic-datatable').DataTable();
						});
					</script>
					<div class="row">

						<div class="col-12">
							<div class="table-responsive">
								<table border="1" WIDTH=100% id="basic-datatable"
									class="table dt-responsive nowrap">

									<thead>
										<tr
											style="text-align: center !important; vertical-align: middle !important;">
											<th class="text-center">Numro</th>
											<th class="text-center">Désingation Type de convention</th>
											<th style="width: 85px;" class="text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${types}" var="p">

											<tr>

												<td><c:out value="${p.id}"></c:out></td>
												<td><c:out value="${p.libelle}"></c:out></td>


												<td><a
													href="TypeConventionServlet?action=modif&id=${p.id}"
													class="action-icon"> <i
														class="mdi mdi-square-edit-outline"></i></a> <a
													href="javascript:confirmation('${p.id}')"
													class="action-icon"> <i
														class="mdi mdi-delete"></i></a></td>
											</tr>
										</c:forEach>

										

									</tbody>
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

	<script src="views/assets/js/vendor.min.js"></script>

	<!-- Plugins js-->
	<script src="views/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="views/assets/libs/jquery-knob/jquery.knob.min.js"></script>
	<script
		src="views/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
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
	
	
	<script src="views/assets/js/app.min.js"></script>


	<script src="views/assets/libs/sweetalert2/sweetalert2.min.js"></script>

	<!-- Sweet alert init js-->
	<script src="views/assets/js/pages/sweet-alerts.init.js"></script>

</body>
</html>