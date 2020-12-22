<%@page import="entities.ParticipantConvention"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Participant"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8" />
<title>Ajoute d'une Convention</title>
	        <link href="views/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

      <link href="views/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
        <link href="views/assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet" type="text/css" />
        <link href="views/assets/libs/clockpicker/bootstrap-clockpicker.min.css" rel="stylesheet" type="text/css" />
        <link href="views/assets/libs/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />

<link href="views/assets/libs/datatables/dataTables.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<link href="views/assets/libs/datatables/responsive.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<link href="views/assets/libs/datatables/buttons.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<link href="views/assets/libs/datatables/select.bootstrap4.css"
	rel="stylesheet" type="text/css" />

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
<script type="text/javascript">
	function confirmation(id) {
		var conf = confirm("Etes vous sure de vouloir supprimer");
		if (conf == true) {
			document.location = "ConventionServlet?action=supprimer&id=" + id;
		}
	}
</script>
<jsp:useBean id="partic" class="dao.ParticipantImp" scope="session"></jsp:useBean>
<jsp:useBean id="particonv" class="dao.ParticipantConventionImp"
	scope="session"></jsp:useBean>

</head>

<body>

	<!-- Begin page -->
	<div id="wrapper">

		<!-- Topbar Start -->
		<div class="navbar-custom">
			<ul class="list-unstyled topnav-menu float-right mb-0">

				<!--    <li class="d-none d-sm-block">
                        < class="app-search">
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
				<a href="views/index.jsp" class="logo text-center"> <span
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

		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->
		<button type="button" style="visibility: hidden" class="btn btn-info btn-xs" id="sa-error">Click me</button>
<script>
function countNotEmptyRows() {
	  var notEmptyRows = $('tr').filter(function(idx, element) {
	    return $(element).find('td input').val() != '';
	  });

	  return notEmptyRows.length;
	}


function ValidateForm() {
	var tbl = document.getElementById('basic-datatable');
	tbl.rows.length=0;
	 if(countNotEmptyRows()==1 || countNotEmptyRows()==2 ){
		  var button = document.querySelector('#sa-error');
		  button.addEventListener('click', function() {  });
		  button.click();
		  
	return false;
	
		
	 } if( countNotEmptyRows()==6 || countNotEmptyRows()==7 ){
		 alert("Tu doit Séléctionner au maximum quatre Participants");
			return false;
	 }
	
	  	 if(countNotEmptyRows()==1){
		 alert("Tu doit Séléctionner au minimum Deux Participants");
			return false;
	 }
	 else 	 if(countNotEmptyRows()==0){
		 alert("Tu doit Séléctionner au minimum Deux Participants");
			return false;
	 }

	var dateen = document.getElementById("dateen").value;
	var dateexp = document.getElementById("dateexp").value;
	var dateedit = document.getElementById("dateedit").value;

	if(dateexp<=dateen){
		alert("La date d'expiration d'une convention doit etre suprieur au date d'entre en vigueur")
		return false;
	}else if(dateexp<=dateedit){
		alert("La date d'expiration d'une convention doit etre suprieur au Date d'dition d'une convention")
		return false;
	}else if(dateen<dateedit){
		alert("Date d'entre en vigueur doit etre suprieur au Date d'dition d'une convention")
		return false;

	}
		//basic-datatable
	
	
	for(int j=0;j<=30;j++){
		var par = document.getElementById(j).value;
		alert(par);
		if(par>dateen){
			alert("Date des Pariticpant doit etre suprieur au Date d'edition d'une convention")
			return false;
break; 
		}
	}
	return true;



}
</script>
		<div class="content-page">
							<form name="form" method="post" action=ConventionServlet onsubmit="return ValidateForm();">
		
			<div class="content">

				<!-- Start Content-->
				<div class="container-fluid">
						<!-- start page title -->
						<div class="row">
							<div class="col-12">
								<div class="page-title-box">
									<div class="page-title-right">
										<div class="form-inline">
											
											
										</div>
									</div>
									<h4 class="page-title">Conventions</h4>
								</div>
							</div>
						</div>



						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-lg-6">

												<div class="form-group mb-3">
													<label for="simpleinput">Type</label> <select
														class="form-control" name="listetype" id="listetype">
														<a><c:out
																value="${conventionInfo.typeConventions.libelle}"></c:out></a>

														<c:forEach items="${types}" var="p">
															<option
																${conventionInfo.typeConventions.libelle==p.libelle ? 'selected' :''}
																class="form-control"><c:out
																	value="${p.libelle}"></c:out></option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="col-lg-6">

												<div class="form-group mb-3">
													<label for="simpleinput">Date d'dition d'une
														convention</label> <input type="text" class="form-control basic-datepicker"
														name="dateedit" id="dateedit" value="${conventionInfo.dateEdition}">
												</div>
											</div>

										
											<div class="col-lg-4">

												<div class="form-group mb-3">
													<label for="simpleinput">Objet</label> <input type="text"
														name="objet" id="objet" class="form-control"
														value="${conventionInfo.objet}" required="required">
												</div>
												<input type="hidden" name="idC" value="${conventionInfo.id}" />
											</div>

											<div class="col-lg-4">

												<div class="form-group mb-3">
													<label for="simpleinput">Date d'entre en vigueur</label> <input
														type="text" id="dateen" name="dateen"  id="dateen"
														class="form-control basic-datepicker"
														value="${conventionInfo.dateEntre}" required="required">
												</div>
											</div>

											<div class="col-lg-4">

												<div class="form-group mb-3">
													<label for="simpleinput">La date de son expiration</label>
													<input type="text" name="dateexp"  id="dateexp"
														class="form-control basic-datepicker"
														value="${conventionInfo.dateExpiration}" required="required">
												</div>
											</div>

										</div>

									</div>
								</div>
							</div>
						</div>
		
				</div>
				<script>
					$(document).ready(function() {
						$('#basic-datatable').DataTable();
					});
				</script>
				<c:if test="${conventionParticipant==null}">

					<div class="row">
						<div class="col-12">
							<div class="table-responsive">
								<table border="1" WIDTH=100% id="basic-datatable"
									class="table dt-responsive nowrap">

									<thead>
										<tr
											style="text-align: center !important; vertical-align: middle !important;">
											<th class="text-center">Listes des participant</th>
											<th class="text-center">Date de Signature( remplir)</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${participants}" var="p5">
											<tr>
												<td><c:out value="${p5.libelle}"></c:out></td>
												<td><input type="text" class="form-control basic-datepicker" id="${p5.id}" name="${p5.id}"></td>
												<input type="hidden" name="id" value="${p5.id}" />
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

					</div>
				</c:if>

				<c:if test="${conventionParticipant!=null}">

					<div class="row">
						<div class="col-12">
							<table border="1" WIDTH=100% id="basic-datatable"
								class="table dt-responsive nowrap">

								<thead>
									<tr
										style="text-align: center !important; vertical-align: middle !important;">
										<th class="text-center">Listes des participant</th>
										<th class="text-center">Date de Signature( remplir)</th>
									</tr>
								</thead>

								<c:forEach items="${conventionParticipant}" var="p2">
									<tr>
										<input type="hidden" name="id" value="${p2.id}" />
										<td><c:out value="${p2.participant.libelle}"></c:out></td>
										<td><input value="${p2.datesignature}" type="text"  class="form-control basic-datepicker"
											name="${p2.participant.id}"></td>
									</tr>
								</c:forEach>

								<c:forEach items="${NotconventionParticipant}" var="pNot">
									<tr>
										<input type="hidden" name="id" value="${pNot.id}" />
										<td><c:out value="${pNot.libelle}"></c:out></td>
										<td><input type="text" class="form-control basic-datepicker" name="${pNot.id}"></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
			</c:if>

			<div class="row">
				<div class="col-md-4"></div>


				<div class="col-md-4">
					<div class="form-group mb-6">
						<h5 class="mb-1 font-8 labeltop">&nbsp;&nbsp;</h5>

						<c:if test="${conventionParticipant==null}">
							<button type="submit" name="action" value="Ajouter"
							id=""	class="btn btn-primary btn-block mt-3 waves-effect waves-light">
								<i class="mdi mdi-plus-circle">Ajouter</i>
							</button>
						</c:if>
						<c:if test="${conventionParticipant!=null}">
							<button type="submit" name="action" value="Modif"
								id="" class="btn btn-primary btn-block mt-3 waves-effect waves-light">
								<i class="mdi mdi-settings">Modifier</i>
							</button>

						</c:if>
					</div>


				</div>
				<div class="col-md-4"></div>

			</div>
		</div>
		<!-- container -->
</form>
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
							href="javascript:void(0);">Help</a> <a href="javascript:void(0);">Contact
							Us</a>
					</div>
				</div>
			</div>
		</div>
	</footer>

	</div>


	<div class="rightbar-overlay"></div>

	<script src="views/assets/js/vendor.min.js"></script>

	<script src="views/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="views/assets/libs/jquery-knob/jquery.knob.min.js"></script>
	<script
		src="views/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
	<script src="views/assets/libs/flot-charts/jquery.flot.js"></script>
	<script src="views/assets/libs/flot-charts/jquery.flot.time.js"></script>
	<script src="views/assets/libs/flot-charts/jquery.flot.tooltip.min.js"></script>
	<script src="views/assets/libs/flot-charts/jquery.flot.selection.js"></script>
	<script src="views/assets/libs/flot-charts/jquery.flot.crosshair.js"></script>

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


   <script src="views/assets/libs/flatpickr/flatpickr.min.js"></script>
        <script src="views/assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
        <script src="views/assets/libs/clockpicker/bootstrap-clockpicker.min.js"></script>
        <script src="views/assets/libs/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="views/assets/js/pages/form-pickers.init.js"></script>
	<script src="views/assets/js/pages/datatables.init.js"></script>

	<script src="views/assets/js/app.min.js"></script>
	
	<script src="views/assets/js/frenchUI.js"></script>
	
	 <script src="views/assets/libs/sweetalert2/sweetalert2.min.js"></script>

        <!-- Sweet alert init js-->
        <script src="views/assets/js/pages/sweet-alerts.init.js"></script>
	

</body>
</html>
