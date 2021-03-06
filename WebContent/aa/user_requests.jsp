<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="DBcon.sqlStatus"%>
<%@page import="DBcon.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>


<%
	sqlStatus sqls = new sqlStatus();
	sqls.stat = true;

	if (null == session.getAttribute("logdIn")
			|| Integer.parseInt(session.getAttribute("logdIn").toString()) != 1) {
		response.sendRedirect("../index.jsp");

	} else {
		int status = Integer.parseInt(session.getAttribute("usr_status").toString());

		switch (status) {
			case 1 :
				response.sendRedirect("../owner/dashboard.jsp");
				break;
			case 2 :
				response.sendRedirect("../user/dashboard.jsp");
				break;
			case 3 :
				response.sendRedirect("../ca/dashboard.jsp");
				break;
			case 4 :
				break;
			case 5 :
				response.sendRedirect("../cloud/dashboard.jsp");
				break;
			default :
				response.sendRedirect("../index.jsp");
				break;
		}
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Title -->
<title>User Requests - AA | xACS</title>

<!-- Required Meta Tags Always Come First -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- Favicon -->
<link rel="shortcut icon" href="../assets/favicon/favicon.ico">
<!-- Google Fonts -->
<link rel="stylesheet"
	href="//fonts.googleapis.com/css?family=Open+Sans%3A400%2C300%2C500%2C600%2C700%7CPlayfair+Display%7CRoboto%7CRaleway%7CSpectral%7CRubik">
<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="../assets/vendor/bootstrap/bootstrap.min.css">
<!-- CSS Global Icons -->
<link rel="stylesheet"
	href="../assets/vendor/icon-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="../assets/vendor/icon-line/css/simple-line-icons.css">
<link rel="stylesheet" href="../assets/vendor/icon-etlinefont/style.css">
<link rel="stylesheet" href="../assets/vendor/icon-line-pro/style.css">
<link rel="stylesheet" href="../assets/vendor/icon-hs/style.css">

<link rel="stylesheet"
	href="../assets/vendor/hs-admin-icons/hs-admin-icons.css">

<link rel="stylesheet" href="../assets/vendor/animate.css">
<link rel="stylesheet"
	href="../assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">

<link rel="stylesheet"
	href="../assets/vendor/flatpickr/dist/css/flatpickr.min.css">
<link rel="stylesheet"
	href="../assets/vendor/bootstrap-select/css/bootstrap-select.min.css">

<link rel="stylesheet"
	href="../assets/vendor/chartist-js/chartist.min.css">
<link rel="stylesheet"
	href="../assets/vendor/chartist-js-tooltip/chartist-plugin-tooltip.css">
<link rel="stylesheet"
	href="../assets/vendor/fancybox/jquery.fancybox.min.css">

<link rel="stylesheet"
	href="../assets/vendor/hamburgers/hamburgers.min.css">

<!-- CSS Unify -->
<link rel="stylesheet" href="../assets/css/unify-admin.css">

<!-- CSS Customization -->
<link rel="stylesheet" href="../assets/css/custom.css">
</head>

<body>
	<!-- Header -->
	<header id="js-header" class="u-header u-header--sticky-top">
		<div
			class="u-header__section u-header__section--admin-dark g-min-height-65">
			<nav class="navbar no-gutters g-pa-0">
				<div
					class="col-auto d-flex flex-nowrap u-header-logo-toggler g-py-12">
					<!-- Logo -->
					<a href="/index.html"
						class="navbar-brand d-flex align-self-center g-hidden-xs-down g-line-height-1 py-0 g-mt-5">

						<img class="img-fluid" src="../assets/img/logo/logo.png"
						height="32" alt="Image Description"
						style="height: 32px !important;">

					</a>
					<!-- End Logo -->

					<!-- Sidebar Toggler -->
					<a
						class="js-side-nav u-header__nav-toggler d-flex align-self-center ml-auto"
						href="#!"
						data-hssm-class="u-side-nav--mini u-sidebar-navigation-v1--mini"
						data-hssm-body-class="u-side-nav-mini"
						data-hssm-is-close-all-except-this="true"
						data-hssm-target="#sideNav"> <i class="hs-admin-align-left"></i>
					</a>
					<!-- End Sidebar Toggler -->
				</div>

				<!-- Top Search Bar -->
				<!-- <form id="searchMenu" class="u-header--search col-sm g-py-12 g-ml-15--sm g-ml-20--md g-mr-10--sm" aria-labelledby="searchInvoker" action="#!">
                        <div class="input-group g-max-width-450">
                            <input class="form-control form-control-md g-rounded-4" type="text" placeholder="Enter search keywords">
                            <button type="submit" class="btn u-btn-outline-primary g-brd-none g-bg-transparent--hover g-pos-abs g-top-0 g-right-0 d-flex g-width-40 h-100 align-items-center justify-content-center g-font-size-18 g-z-index-2"><i class="hs-admin-search"></i>
                            </button>
                        </div>
                    </form>-->
				<!-- End Top Search Bar -->

				<!-- Messages/Notifications/Top Search Bar/Top User -->
				<div class="col-auto d-flex g-py-12 g-pl-40--lg ml-auto">

					<!-- Top Search Bar (Mobi) -->
					<!--                        <a id="searchInvoker" class="g-hidden-sm-up text-uppercase u-header-icon-v1 g-pos-rel g-width-40 g-height-40 rounded-circle g-font-size-20" href="#!" aria-controls="searchMenu" aria-haspopup="true" aria-expanded="false" data-is-mobile-only="true" data-dropdown-event="click"
                                                   data-dropdown-target="#searchMenu" data-dropdown-type="css-animation" data-dropdown-duration="300" data-dropdown-animation-in="fadeIn" data-dropdown-animation-out="fadeOut">
                                                    <i class="hs-admin-search g-absolute-centered"></i>
                                                </a>-->
					<!-- End Top Search Bar (Mobi) -->

					<!-- Top User -->
					<div class="col-auto d-flex g-pt-5 g-pt-0--sm g-pl-2 g-pl-2--sm">
						<div class="g-pos-rel g-px-10--lg">
							<a id="profileMenuInvoker" class="d-block" href="#!"
								aria-controls="profileMenu" aria-haspopup="true"
								aria-expanded="false" data-dropdown-event="click"
								data-dropdown-target="#profileMenu"
								data-dropdown-type="css-animation" data-dropdown-duration="300"
								data-dropdown-animation-in="fadeIn"
								data-dropdown-animation-out="fadeOut"> <span
								class="g-pos-rel"> <span
									class="u-badge-v2--xs u-badge--top-right g-hidden-sm-up g-bg-lightblue-v5 g-mr-5"></span>
									<img
									class="g-width-30 g-width-40--md g-height-30 g-height-40--md rounded-circle g-mr-10--sm"
									src="../assets/img/user.png" alt="Image description">
							</span> <span class="g-pos-rel g-top-2"> <span
									class="g-hidden-sm-down"><%=session.getAttribute("usr_name")%></span>
									<i class="hs-admin-angle-down g-pos-rel g-top-2 g-ml-10"></i>
							</span>
							</a>

							<!-- Top User Menu -->
							<ul id="profileMenu"
								class="g-pos-abs g-left-0 g-width-100x--lg g-nowrap g-font-size-14 g-py-20 g-mt-17 rounded"
								aria-labelledby="profileMenuInvoker">
								<li class="g-mb-10"><a
									class="media g-color-lightred-v2--hover g-py-5 g-px-20"
									href="#!"> <span class="d-flex align-self-center g-mr-12">
											<i class="hs-admin-layout-accordion-list"></i>
									</span> <span class="media-body align-self-center">My Profile</span>
								</a></li>
								<li class="mb-0"><a
									class="media g-color-lightred-v2--hover g-py-5 g-px-20"
									href="../signoutScript"> <span
										class="d-flex align-self-center g-mr-12"> <i
											class="hs-admin-shift-right"></i>
									</span> <span class="media-body align-self-center">Sign Out</span>
								</a></li>
							</ul>
							<!-- End Top User Menu -->
						</div>
					</div>
					<!-- End Top User -->
				</div>
				<!-- End Messages/Notifications/Top Search Bar/Top User -->

			</nav>


		</div>
	</header>
	<!-- End Header -->


	<main class="container-fluid px-0 g-pt-65">
	<div class="row no-gutters g-pos-rel g-overflow-x-hidden">
		<!-- Sidebar Nav -->
		<div id="sideNav"
			class="col-auto u-sidebar-navigation-v1 u-sidebar-navigation--dark">
			<ul id="sideNavMenu"
				class="u-sidebar-navigation-v1-menu u-side-nav--top-level-menu g-min-height-100vh mb-0">
				<!-- Dashboards -->
				<li
					class="u-sidebar-navigation-v1-menu-item u-side-nav--top-level-menu-item">
					<a
					class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12"
					href="dashboard.jsp"> <span
						class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
							<i class="hs-admin-server"></i>
					</span> <span class="media-body align-self-center">Dashboard</span>
				</a>
				</li>
				<li
					class="u-sidebar-navigation-v1-menu-item u-side-nav--top-level-menu-item">
					<a
					class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12"
					href="file_details.jsp"> <span
						class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
							<i class="hs-admin-agenda"></i>
					</span> <span class="media-body align-self-center">File Details</span>
				</a>
				</li>
				<li
					class="u-sidebar-navigation-v1-menu-item u-side-nav--top-level-menu-item  has-active">
					<a
					class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12"
					href="user_requests.jsp"> <span
						class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
							<i class="hs-admin-receipt"></i>
					</span> <span class="media-body align-self-center">User Requests</span>
				</a>
				</li>
			</ul>
		</div>
		<!-- End Sidebar Nav -->


		<div
			class="col g-bg-lightblue-v10-opacity-0_5 g-ml-45 g-ml-0--lg g-pb-65--md">
			<!-- Breadcrumb-v1 -->
			<div class="g-hidden-sm-down g-bg-gray-light-v8 g-pa-20">
				<ul class="u-list-inline g-color-gray-dark-v6">

					<li class="list-inline-item g-mr-10"><a
						class="u-link-v5 g-color-gray-dark-v6 g-color-lightblue-v3--hover g-valign-middle"
						href="dashboard.jsp">Attribute Authority</a> <i
						class="hs-admin-angle-right g-font-size-12 g-color-gray-light-v6 g-valign-middle g-ml-10"></i>
					</li>

					<li class="list-inline-item"><span class="g-valign-middle">User
							Requests</span></li>
				</ul>
			</div>
			<!-- End Breadcrumb-v1 -->

			<div class="g-pa-20">

				<div class="alert alert-success alert-dismissible fade show"
					role="alert" id="sendSuccAlert"
					style="visibility: hidden; display: none;">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="h5">
						<i class="fa fa-check-circle-o"></i> SK Sent!
					</h4>
					<!--You successfully activated .-->
				</div>

				<div class="alert alert-danger alert-dismissible fade show"
					role="alert" id="sendFailAlert"
					style="visibility: hidden; display: none;">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="h5">
						<i class="fa fa-minus-circle"></i> Unable to send SK! Please try
						again later.
					</h4>
					<!--Change a few things up and try submitting again.-->
				</div>

				<div class="alert alert-danger alert-dismissible fade show"
					role="alert" id="sqlFailAlert"
					style="visibility: hidden; display: none;">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="h5">
						<i class="fa fa-minus-circle"></i> Unable to connect to SQL
						Server!
					</h4>
					<!--Change a few things up and try submitting again.-->
				</div>

				<!--<h1 class="g-font-weight-300 g-font-size-28 g-color-black g-mb-30">User Details</h1>-->
				<div class="media-md align-items-center g-mb-30">
					<div class="d-flex g-mb-15 g-mb-0--md">
						<h1 class="g-font-weight-500 g-font-size-28 g-color-black">Download
							Requests</h1>
					</div>

					<div class="media d-md-flex align-items-center ml-auto">

						<div class="d-flex g-ml-15 g-ml-55--md">
							<div class="input-group g-pos-rel g-width-320--md">
								<input id="datatableSearch1"
									class="form-control g-font-size-default g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-rounded-20 g-pl-20 g-pr-50 g-py-10"
									type="text" placeholder="Search">
								<button
									class="btn g-pos-abs g-top-0 g-right-0 g-z-index-2 g-width-60 h-100 g-bg-transparent g-font-size-16 g-color-lightred-v2 g-color-lightblue-v3--hover rounded-0"
									type="submit">
									<i class="hs-admin-search g-absolute-centered"></i>
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="g-mb-40">
					<div class="table-responsive">
						<table
							class="js-datatable table table-striped u-table--v3 u-editable-table--v1 g-color-black u-card-v1 dataTable no-footer"
							data-dt-search="#datatableSearch1"
							data-dt-pagination="datatablePagination1"
							data-dt-page-length="500" data-dt-is-responsive="false">
							<thead>
								<tr>
									<th>
										<div class="media">
											<div class="d-flex align-self-center">#</div>

											<div class="d-flex align-self-center ml-auto">
												<span
													class="d-inline-block g-width-10 g-line-height-1 g-font-size-10">
													<a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-up"></i>
												</a> <a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-down"></i>
												</a>
												</span>
											</div>
										</div>
									</th>
									<th>
										<div class="media">
											<div class="d-flex align-self-center">Name</div>

											<div class="d-flex align-self-center ml-auto">
												<span
													class="d-inline-block g-width-10 g-line-height-1 g-font-size-10">
													<a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-up"></i>
												</a> <a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-down"></i>
												</a>
												</span>
											</div>
										</div>
									</th>
									<th>
										<div class="media">
											<div class="d-flex align-self-center">Email</div>

											<div class="d-flex align-self-center ml-auto">
												<span
													class="d-inline-block g-width-10 g-line-height-1 g-font-size-10">
													<a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-up"></i>
												</a> <a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-down"></i>
												</a>
												</span>
											</div>
										</div>
									</th>
									<th>
										<div class="media">
											<div class="d-flex align-self-center g-nowrap">State</div>

											<div class="d-flex align-self-center ml-auto">
												<span
													class="d-inline-block g-width-10 g-line-height-1 g-font-size-10">
													<a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-up"></i>
												</a> <a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-down"></i>
												</a>
												</span>
											</div>
										</div>
									</th>
									<th>
										<div class="media">
											<div class="d-flex align-self-center g-nowrap">Country</div>

											<div class="d-flex align-self-center ml-auto">
												<span
													class="d-inline-block g-width-10 g-line-height-1 g-font-size-10">
													<a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-up"></i>
												</a> <a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-down"></i>
												</a>
												</span>
											</div>
										</div>
									</th>
									<th>
										<div class="media">
											<div class="d-flex align-self-center g-nowrap">File
												Name</div>

											<div class="d-flex align-self-center ml-auto">
												<span
													class="d-inline-block g-width-10 g-line-height-1 g-font-size-10">
													<a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-up"></i>
												</a> <a
													class="g-color-gray-light-v6 g-color-lightblue-v3--hover g-text-underline--none--hover"
													href="#!"> <i class="hs-admin-angle-down"></i>
												</a>
												</span>
											</div>
										</div>
									</th>
									<th></th>
								</tr>
							</thead>

							<tbody>
								<%
									Connection con = null;
									Statement st = null;
									ResultSet rs = null;
									int count = 0;

									String user_id = (String) session.getAttribute("usr_id");
									String aaNum = "";
									try {
										Class.forName("com.mysql.jdbc.Driver");
										con = DriverManager.getConnection("jdbc:mysql://localhost:3306/xacs_aa", "xacs", "xacspassword");
										st = con.createStatement();
										rs = st.executeQuery("select * from aalist where AID = '"+user_id+"'");
										while (rs.next()) {
											aaNum = rs.getString("aaNum");
										}
									} catch (Exception ex) {
										ex.printStackTrace();
									}
									
									String aaTable = "aa" + aaNum + "reqs";
									System.out.println(aaTable);

									try {
										Class.forName("com.mysql.jdbc.Driver");
										Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xacs_aa", "xacs",
												"xacspassword");
										st = conn.createStatement();
										rs = st.executeQuery("select * from " + aaTable + " WHERE status = 'No'");
										while (rs.next()) {
											count++;
								%>
								<tr>
									<td><%=count%></td>
									<td><%=rs.getString("name")%></td>
									<td><%=rs.getString("mail")%></td>
									<td><%=rs.getString("state")%></td>
									<td><%=rs.getString("country")%></td>
									<td><%=rs.getString("fname")%></td>
									<td style="width: 0.1%; white-space: nowrap;">
										<div class="media">
											<div class="media-body align-self-center" href="#!">
												<a
													class="u-tags-v1 text-center g-bg-lightblue-v3 g-brd-lightblue-v3 g-width-140 g-color-white g-brd-around g-rounded-50 g-py-4 g-px-15"
													href="../aa_send?id=<%=rs.getString("id")%>"
													style="font-weight: bolder;">Send</a>
											</div>
										</div>
									</td>
								</tr>
								<%
									}
									} catch (Exception ex) {
										sqls.stat = false;
										ex.printStackTrace();
									}
								%>
							</tbody>
						</table>
					</div>
				</div>

				<!--                        <div class="media align-items-center g-mb-45">
                                                    <div id="datatableInfo1" class="media-body"></div>
                        
                                                    <nav id="datatablePagination1" class="d-flex ml-auto" aria-label="Page Navigation"></nav>
                                                </div>-->
			</div>

			<!-- Footer -->
			<footer id="footer"
				class="u-footer--bottom-sticky g-bg-white g-color-gray-dark-v6 g-brd-top g-brd-gray-light-v7 g-pa-20">
				<div class="row align-items-center">
					<!-- Footer Nav -->
					<div class="col-md-8 g-mb-10 g-mb-0--md">
						<ul class="list-inline text-center text-md-left mb-0">
							<li class="list-inline-item"><a
								class="g-color-gray-dark-v6 g-color-lightblue-v3--hover"
								href="#!">FAQ</a></li>
							<li class="list-inline-item"><span
								class="g-color-gray-dark-v6">|</span></li>
							<li class="list-inline-item"><a
								class="g-color-gray-dark-v6 g-color-lightblue-v3--hover"
								href="#!">Support</a></li>
							<li class="list-inline-item"><span
								class="g-color-gray-dark-v6">|</span></li>
							<li class="list-inline-item"><a
								class="g-color-gray-dark-v6 g-color-lightblue-v3--hover"
								href="#!">Contact Us</a></li>
						</ul>
					</div>
					<!-- End Footer Nav -->

					<!-- Footer Copyrights -->
					<div class="col-md-4 text-center text-md-right">
						<small class="d-block g-font-size-default">&copy; 2018
							xACS. All Rights Reserved.</small>
					</div>
					<!-- End Footer Copyrights -->
				</div>
			</footer>
			<!-- End Footer -->
		</div>
	</div>
	</main>

	<!-- JS Global Compulsory -->
	<script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/jquery-migrate/jquery-migrate.min.js"></script>

	<script src="../assets/vendor/popper.min.js"></script>
	<script src="../assets/vendor/bootstrap/bootstrap.min.js"></script>

	<script src="../assets/vendor/cookiejs/jquery.cookie.js"></script>


	<!-- jQuery UI Core -->
	<script src="../assets/vendor/jquery-ui/ui/widget.js"></script>
	<script src="../assets/vendor/jquery-ui/ui/version.js"></script>
	<script src="../assets/vendor/jquery-ui/ui/keycode.js"></script>
	<script src="../assets/vendor/jquery-ui/ui/position.js"></script>
	<script src="../assets/vendor/jquery-ui/ui/unique-id.js"></script>
	<script src="../assets/vendor/jquery-ui/ui/safe-active-element.js"></script>

	<!-- jQuery UI Helpers -->
	<script src="../assets/vendor/jquery-ui/ui/widgets/menu.js"></script>
	<script src="../assets/vendor/jquery-ui/ui/widgets/mouse.js"></script>

	<!-- jQuery UI Widgets -->
	<script src="../assets/vendor/jquery-ui/ui/widgets/datepicker.js"></script>

	<!-- JS Plugins Init. -->
	<script src="../assets/vendor/appear.js"></script>
	<script
		src="../assets/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="../assets/vendor/flatpickr/dist/js/flatpickr.min.js"></script>
	<script
		src="../assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="../assets/vendor/chartist-js/chartist.min.js"></script>
	<script
		src="../assets/vendor/chartist-js-tooltip/chartist-plugin-tooltip.js"></script>
	<script src="../assets/vendor/fancybox/jquery.fancybox.min.js"></script>
	<script
		src="../assets/vendor/datatables/media/js/jquery.dataTables.min.js"></script>
	<script src="../assets/vendor/datatables/media/js/dataTables.select.js"></script>

	<!-- JS Unify -->
	<script src="../assets/js/hs.core.js"></script>
	<script src="../assets/js/components/hs.side-nav.js"></script>
	<script src="../assets/js/helpers/hs.hamburgers.js"></script>
	<script src="../assets/js/components/hs.range-datepicker.js"></script>
	<script src="../assets/js/components/hs.datepicker.js"></script>
	<script src="../assets/js/components/hs.dropdown.js"></script>
	<script src="../assets/js/components/hs.scrollbar.js"></script>
	<script src="../assets/js/components/hs.area-chart.js"></script>
	<script src="../assets/js/components/hs.donut-chart.js"></script>
	<script src="../assets/js/components/hs.bar-chart.js"></script>
	<script src="../assets/js/helpers/hs.focus-state.js"></script>
	<script src="../assets/js/components/hs.popup.js"></script>
	<script src="../assets/js/components/hs.datatables.js"></script>

	<!-- JS Custom -->
	<script src="../assets/js/custom.js"></script>

	<!-- JS Plugins Init. -->
	<script>
		$(document).on('ready', function() {
			// initialization of custom select
			$('.js-select').selectpicker();

			// initialization of sidebar navigation component
			$.HSCore.components.HSSideNav.init('.js-side-nav');

			// initialization of hamburger
			$.HSCore.helpers.HSHamburgers.init('.hamburger');

			// initialization of HSDropdown component
			$.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
				dropdownHideOnScroll : false,
				dropdownType : 'css-animation',
				dropdownAnimationIn : 'fadeIn',
				dropdownAnimationOut : 'fadeOut'
			});

			// initialization of custom scrollbar
			$.HSCore.components.HSScrollBar.init($('.js-custom-scroll'));

			// initialization of datatables
			$.HSCore.components.HSDatatables.init('.js-datatable');
		});
	</script>

	<script>
		$(document).ready(
				function() {

					if (window.location.href.indexOf('#sendSucc') !== -1) {
						$('#sendSuccAlert').css({
							'visibility' : 'visible',
							'display' : 'block'
						});
						$('#sendSuccAlert').show();
					} else {
						$('#sendSuccAlert').hide();
					}

					if (window.location.href.indexOf('#sendFail') !== -1) {
						$('#sendFailAlert').css({
							'visibility' : 'visible',
							'display' : 'block'
						});
						$('#sendFailAlert').show();
					} else {
						$('#sendFailAlert').hide();
					}

					if (window.location.href.indexOf('#sqlFail') !== -1
							|| !(
	<%=sqls.stat%>
		)) {
						$('#sqlFailAlert').css({
							'visibility' : 'visible',
							'display' : 'block'
						});
						$('#sqlFailAlert').show();
					} else {
						$('#sqlFailAlert').hide();
					}

				});
	</script>
</body>

</html>
