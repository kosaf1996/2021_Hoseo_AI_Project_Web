<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="Anomaly.service.AnomalyService"%>
<%@page import="Anomaly.model.*"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Smart Home Checker</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>




<%
	//Image Date
	String today = null;
	Date date = new Date();
	SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH");
	Calendar cal = Calendar.getInstance();
	cal.setTime(date);
	cal.setTime(date);
	cal.add(Calendar.HOUR, -1);
	today = sdformat.format(cal.getTime());

	//Service
	AnomalyService anomaly_service = AnomalyService.getInstance();

	//login.proc 에서 넘겨받음 login user 의 대한 uscd   --> session
	int uscd = (Integer) session.getAttribute("uscd");

	//Data Load
	List<AnomalyRec> list_anomaly = anomaly_service.data_list(0);

	String Abnomaly = "Abnomaly";
	String Normalcy = "Normalcy";

	//img path
	String Temp = ("img/Temp_Detection" + today + "_" + uscd + ".png");
	String Humidity = ("img/Humidity_Detection" + today + "_" + uscd + ".png");
	System.out.println(Temp);
%>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div> <!-- 좌측 메뉴바 시작 지점---------------------------------------------------------------->
				<!-- 좌측 상단 네임 -->
				<div class="sidebar-brand-text mx-3">S H C</div>
			</a>



			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="index.jsp">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">



		</ul>

		<!-- End of Sidebar -->
		<!-- 좌측 메뉴바 끝 지점---------------------------------------------------------------->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">


				<!-- 상단바 시작 지점 -->
				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Topbar Search -->

				<div class="input-group">
					<a class="nav-link" href="index.jsp"> <i
						class="fas fa-fw fa-tachometer-alt"></i> <span>Smart Home
							Checker</span></a>
					<div class="input-group-append"></div>
				</div>


				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- Nav Item - Search Dropdown (Visible Only XS) -->
					<li class="nav-item dropdown no-arrow d-sm-none"><a
						class="nav-link dropdown-toggle" href="#" id="searchDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
					</a> <!-- Dropdown - Messages -->
						<div
							class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
							aria-labelledby="searchDropdown">
							<form class="form-inline mr-auto w-100 navbar-search">
								<div class="input-group">
									<input type="text" class="form-control bg-light border-0 small"
										placeholder="Search for..." aria-label="Search"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div></li>


					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- 상단바 User name / img -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-600 small">Hoseo_AI_Project</span>
							<img class="img-profile rounded-circle"
							src="img/undraw_profile.svg">
					</a> <!-- Dropdown - User Information -->
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">
							<a class="dropdown-item" href="#"> <i
								class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
							</a> <a class="dropdown-item" href="#"> <i
								class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
							</a> <a class="dropdown-item" href="#"> <i
								class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity
								Log
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#" data-toggle="modal"
								data-target="#logoutModal"> <i
								class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								Logout
							</a>
						</div></li>

				</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

					</div>


					<!-- 검색 기능 비활성화  	
					
					
					
					<!--  Data Table -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">User
								Infomation</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Uscd</th>
											<th>Time</th>
											<th>Name</th>
											<th>Address</th>
											<th>Age</th>
											<th>Temp</th>
											<th>Humidity</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td><%=uscd%></td>
											<td><%=today%></td>
											<td><%= session.getAttribute("name")%></td>
											<td><%= session.getAttribute("address")%></td>
											<td><%= session.getAttribute("age")%></td>
											<td>
												<%
													if (list_anomaly.get(0).getTemp() == 0) {
												%> <%=Normalcy%> <%
												 	} else {
												 %><%=Abnomaly%> <%
												 	}
												 %>

											</td>
											<td>
												<%
													if (list_anomaly.get(0).getHumidity() == 0) {
												%> <%=Normalcy%> <%
												 	} else {
												 %><%=Abnomaly%> <%
												 	}
												 %>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- Content Row -->
					<div class="row">


						<!-- Temp -->
						<div class=row>
							<div class=col>
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">Temp
											Anomaly</h6>
									</div>

									<div class="card-body">
										<div class="text-center">

											<img class="img-fluid px-0 px-sm-1 mt-0 mb-1"
												style="width: 25rem;" src=" <%=Temp%>" alt="">
										</div>
										<p>
											Add some quality, svg illustrations to your project courtesy
											of <a target="_blank" rel="nofollow"
												href="https://undraw.co/">unDraw</a>, a constantly updated
											collection of beautiful svg images that you can use
											completely free and without attribution!
										</p>
										<a target="_blank" rel="nofollow" href="">Browse
											Illustrations on unDraw &rarr;</a>
									</div>
								</div>
							</div>

							<div class="col">


								<!-- Humidity -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">Humidity
											Anomaly</h6>
									</div>
									<div class="card-body">
										<div class="text-center">

											<img class="img-fluid px-0 px-sm-1 mt-0 mb-1"
												style="width: 25rem;" src=" <%=Humidity%>" alt="">
										</div>
										<p>
											Add some quality, svg illustrations to your project courtesy
											of <a target="_blank" rel="nofollow"
												href="https://undraw.co/">unDraw</a>, a constantly updated
											collection of beautiful svg images that you can use
											completely free and without attribution!
										</p>
										<a target="_blank" rel="nofollow" href="">Browse
											Illustrations on unDraw &rarr;</a>
									</div>
								</div>
							</div>
						</div>


						<!-- Eletronic -->
						<div class=row>
							<div class=col>
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">Eletronic
											Anomaly</h6>
									</div>

									<div class="card-body">
										<div class="text-center">

											<img class="img-fluid px-0 px-sm-1 mt-0 mb-1"
												style="width: 25rem;" src=" <%=Temp%>" alt="">
										</div>
										<p>
											Add some quality, svg illustrations to your project courtesy
											of <a target="_blank" rel="nofollow"
												href="https://undraw.co/">unDraw</a>, a constantly updated
											collection of beautiful svg images that you can use
											completely free and without attribution!
										</p>
										<a target="_blank" rel="nofollow" href="">Browse
											Illustrations on unDraw &rarr;</a>
									</div>
								</div>
							</div>

							<div class="col">


								<!-- Water -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">Water
											Anomaly</h6>
									</div>
									<div class="card-body">
										<div class="text-center">

											<img class="img-fluid px-0 px-sm-1 mt-0 mb-1"
												style="width: 25rem;" src="<%=Humidity%>" alt="">
										</div>
										<p>
											Add some quality, svg illustrations to your project courtesy
											of <a target="_blank" rel="nofollow"
												href="https://undraw.co/">unDraw</a>, a constantly updated
											collection of beautiful svg images that you can use
											completely free and without attribution!
										</p>
										<a target="_blank" rel="nofollow" href="">Browse
											Illustrations on unDraw &rarr;</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Data Table End -->
				<!-- /.container-fluid -->




				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright &copy; Hoseo University Computer Engineering</span>
				</div>
			</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>

	</div>
	

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>
	<script type="text/javascript">
		function sm() {
			//alert('aa');
			document.frm2.submit();
		}
	</script>

</body>


</html>