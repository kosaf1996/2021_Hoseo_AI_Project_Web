<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String id = "";

	try {
		Cookie[] cookies = request.getCookies(); // ��û���� ��Ű�� �����´�.

		if (cookies != null) { // ��Ű�� Null�� �ƴҶ�,

			for (int i = 0; i < cookies.length; i++) { // ��Ű�� �ݺ������� ������.
				if (cookies[i].getName().equals("id")) { // ��Ű�� �̸��� id �϶�
					id = cookies[i].getValue(); // �ش� ��Ű�� ���� id ������ �����Ѵ�.
				}
			}
		}
	} catch (Exception e) {

	}

	//System.out.print(id);
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Smart Home Checker - Login</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">


<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>





									<form name="loginForm" id="loginForm"
										action="../login/login_proc.jsp" method="post">

										<div class="form-group has-feedback">
											<input type="text" class="form-control" id="userid"
												name="userid" placeholder="UserID"> <span
												class="glyphicon glyphicon-user form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback">
											<input type="password" class="form-control" name="password"
												name="password" placeholder="Password"> <span
												class="glyphicon glyphicon-lock form-control-feedback"></span>
										</div>
										<div class="row">
											<div class="col-xs-8">
												<div class="checkbox icheck">
													<input type="checkbox" id="idsave" name="idsave"
														<%if (!id.equals("")) {%> checked="checked" <%}%>>
													<font face="Nanum Gothic"> Remember ID </font><br>
												</div>
											</div>


											<!-- /.col -->
											<div class="col-xs-4">
												<button type="submit"
													class="btn btn-primary btn-block btn-flat"
													onclick="return sendit()">Log In</button>
											</div>
											<!-- /.col -->
										</div>
									</form>






									<hr>

								</div>
							</div>
						</div>
					</div>
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


	<script type="text/javascript">
		window.onload = function() {

			if (getCookie("id")) { // getCookie�Լ��� id��� �̸��� ��Ű�� �ҷ��ͼ� �������
				document.loginForm.userid.value = getCookie("id"); //input �̸��� id�ΰ��� getCookie("id")���� �־���
				document.loginForm.password.value = getCookie("password");
				//document.loginForm.idsave.checked = true;
			}
		}

		function setCookie(name, value, expiredays) //��Ű �����Լ�
		{
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = name + "=" + escape(value) + "; path=/; expires="
					+ todayDate.toGMTString() + ";"
		}

		function getCookie(Name) { // ��Ű �ҷ����� �Լ�
			var search = Name + "=";
			if (document.cookie.length > 0) { // if there are any cookies
				offset = document.cookie.indexOf(search);
				if (offset != -1) { // if cookie exists
					offset += search.length; // set index of beginning of value
					end = document.cookie.indexOf(";", offset); // set index of end of cookie value
					if (end == -1)
						end = document.cookie.length;
					return unescape(document.cookie.substring(offset, end));
				}
			}
		}

		function sendit() {
			//alert('aa');
			var frm = document.loginForm;
			if (!frm.userid.value) { //���̵� �Է����� ������.
				alert("���̵� �Է� ���ּ���.");
				frm.userid.focus();
				return false;
			}
			if (!frm.password.value) { //�н����带 �Է����� ������.
				alert("�н����带 �Է� ���ּ���.");
				frm.password.focus();
				return false;
			}

			if (document.loginForm.idsave.checked == true) { // ���̵� ������ üũ �Ͽ�����
				setCookie("id", document.loginForm.userid.value, 7); //��Ű�̸��� id�� ���̵��Է��ʵ尪�� 7�ϵ��� ����
				setCookie("password", document.loginForm.password.value, 7);
			} else { // ���̵� ������ üũ ���� �ʾ�����
				setCookie("id", document.loginForm.userid.value, 0); //��¥�� 0���� �����Ͽ� ��Ű����
				setCookie("password", document.loginForm.password.value, 0);
			}

			//return false;
			document.loginForm.submit(); //��ȿ�� �˻簡 ����Ǹ� ������ ����.

		}
	</script>
</body>

</html>