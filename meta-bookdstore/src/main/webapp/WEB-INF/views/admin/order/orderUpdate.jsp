<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Meta-Book Admin</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="/img/favicon.png">

    <!-- Custom fonts for this template -->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <style>
        .nav-link {
            padding-top: 2rem!important;
            padding-bottom: 2rem!important;
        }
    </style>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/main">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">MetaBook Admin <sup>2</sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Tables -->
        <li class="nav-item active">
            <a class="nav-link" href="/admin/book">
                <i class="fas fa-fw fa-table"></i>
                <span>책 정보 관리</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Tables -->
        <li class="nav-item active">
            <a class="nav-link" href="/admin/member">
                <i class="fas fa-fw fa-table"></i>
                <span>회원 정보 관리</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Tables -->
        <li class="nav-item active">
            <a class="nav-link" href="/admin/order">
                <i class="fas fa-fw fa-table"></i>
                <span>주문 관리</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <form class="form-inline">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                </form>

                <!-- Topbar Search -->
                <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                               aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
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
                        </div>
                    </li>
                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">admin</span>
                            <img class="img-profile rounded-circle"
                                 src="/image/admin.png">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="/logout">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Order Update Page</h1>
                <p class="mb-4">주문정보 관리 페이지 입니다. </p>

                <div class=" space-bottom-3">
                    <div class="container" style="margin-bottom: 8rem;">
                        <div class="py-5 py-lg-7" style="padding-top: 1rem!important; padding-bottom: 1rem!important;">
                            <h3 class="font-weight-medium font-size-7 text-center mt-lg-1">주문 정보</h3>
                        </div>
                        <div class="max-width-890 mx-auto">
                            <div class="bg-white pt-6 border">
                                <div class="border-bottom mb-5 pb-5 overflow-auto overflow-md-visible" style="overflow: hidden!important;">
                                    <div class="pl-3" style="text-align: center; margin-top: 3rem; padding-left: 0rem!important;">
                                        <table class="table table-borderless mb-0 ml-1">
                                            <thead>
                                            <tr>
                                                <th scope="col" class="font-size-2 font-weight-normal py-0" style="width: 10rem;">Order number:</th>
                                                <th scope="col" class="font-size-2 font-weight-normal py-0" style="width: 10rem;">Date:</th>
                                                <th scope="col" class="font-size-2 font-weight-normal py-0" style="width: 10rem;">Total:</th>
                                                <th scope="col" class="font-size-2 font-weight-normal py-0" style="width: 10rem;">Payment method:</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <th scope="row" class="pr-0 py-0 font-weight-medium" style="padding: 0rem;">${orderInfo.order_no}</th>
                                                <td class="pr-0 py-0 font-weight-medium" style="padding: 0rem;">${orderInfo.order_date}</td>
                                                <td class="pr-0 py-0 font-weight-medium" style="padding: 0rem;">
                                                    <fmt:formatNumber value="${orderInfo.order_price}" pattern="###,###">
                                                    </fmt:formatNumber>원</td>
                                                <td class="pr-0 py-0 font-weight-medium" style="padding: 0rem;">Direct bank transfer</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="border-bottom mb-5 pb-6">
                                    <div class="px-3 px-md-4" style="padding-left: 5rem!important; padding-right: 4rem!important;">
                                        <div class="ml-md-2">
                                            <h6 class="font-size-3 on-weight-medium mb-4 pb-1">Order Details</h6>
                                            <c:forEach items="${orderItems}" var="item">
                                                <div class="d-flex justify-content-between mb-4"
                                                     style="width: 100%;">
                                                    <div class="d-flex align-items-center" style="width: 40%;">
                                                        <div style="width: 100%; margin-bottom: 2rem;">
                                                            <h6 class="font-size-2 font-weight-normal mb-1">
                                                                    ${item.title}</h6>
                                                            <span class="font-size-2 text-gray-600">< ${item.author} ></span>
                                                        </div>
                                                        <span class="font-size-2 ml-4 ml-md-8">x${item.order_qt}</span>
                                                    </div>
                                                    <span class="font-weight-medium font-size-2"><fmt:formatNumber
                                                            value="${item.total_price}" pattern="###,###"></fmt:formatNumber>원</span>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="border-bottom mb-5 pb-5" style="padding-left: 2.5rem; padding-right: 2.5rem;">
                                    <ul class="list-unstyled px-3 pl-md-5 pr-md-4 mb-0">
                                        <li class="d-flex justify-content-between py-2"><span
                                                class="font-weight-medium font-size-2">Subtotal:</span> <span
                                                class="font-weight-medium font-size-2"><fmt:formatNumber
                                                value="${orderInfo.order_price}" pattern="###,###"></fmt:formatNumber>원</span></li>
                                        <li class="d-flex justify-content-between py-2"><span
                                                class="font-weight-medium font-size-2">Shipping:</span> <span
                                                class="font-weight-medium font-size-2">Free Shipping</span></li>
                                        <li class="d-flex justify-content-between pt-2"><span
                                                class="font-weight-medium font-size-2">Payment Method:</span> <span
                                                class="font-weight-medium font-size-2">Direct bank
										transfer</span></li>
                                    </ul>
                                </div>
                                <div class="border-bottom mb-5 pb-4" style="padding-left: 2.5rem; padding-right: 2.5rem;">
                                    <div class="px-3 pl-md-5 pr-md-4">
                                        <div class="d-flex justify-content-between" style="margin-bottom: 1.5rem;">
                                            <span class="font-size-2 font-weight-medium">Total</span> <span
                                                class="font-weight-medium fon-size-2"><fmt:formatNumber
                                                value="${orderInfo.order_price}" pattern="###,###"></fmt:formatNumber>원</span>
                                        </div>
                                    </div>
                                </div>
                                <form method="post" action="/admin/orderUpdate">
                                <div class="border-bottom mb-5 pb-4" style="padding-left: 5.5rem;">
                                    <div class="row row-cols-1 row-cols-md-2">
                                        <div class="col" style="max-width: 45%;">
                                            <h6 class="font-weight-medium font-size-22 mb-3">Shipping
                                                Address</h6>
                                            <address class="d-flex flex-column mb-0">
                                                <span class="text-gray-600 font-size-2">${orderInfo.receiver_name } | ${orderInfo.receiver_phone}</span>
                                                <span class="text-gray-600 font-size-2">${orderInfo.receiver_roadAddress }</span>
                                                <span class="text-gray-600 font-size-2">${orderInfo.receiver_otherAddress }</span>
                                                <span class="text-gray-600 font-size-2">${orderInfo.receiver_zipcode }</span>
                                                <span class="text-gray-600 font-size-2">Republic Of Korea</span>
                                            </address>
                                        </div>
                                        <div>

                                                <div class="mb-3">
                                                    <div>
                                                        <label class="form-label">< 배송지 주소 변경 ></label>
                                                    </div>
                                                    <label class="form-label">우편번호</label>
                                                    <div class="addrBtn" style="margin-bottom: 10px;">
                                                        <input type="text" style="width: 30%; margin-bottom: 1rem;"
                                                               value="${orderInfo.receiver_zipcode}"
                                                               class="form-control rounded-0 height-2 px-2"
                                                               name="receiver_zipcode" id="receiver_zipcode" placeholder="우편번호" readonly>
                                                        <button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
                                                    </div>
                                                    <c:if test="${!empty errorMap}">
                                                        <strong style="color: red;">${errorMap.zipcode}</strong>
                                                    </c:if>
                                                    도로명 주소 <input type="text" style="margin-top: 15px; margin-bottom: 15px;"
                                                                  value="${orderInfo.receiver_roadAddress}"
                                                                  class="form-control rounded-0 height-4 px-4"
                                                                  name="receiver_roadAddress" id="receiver_roadAddress"
                                                                  placeholder="주소검색을 해주세요" readonly>
                                                    <c:if test="${!empty errorMap}">
                                                        <strong style="color: red;">${errorMap.roadAddress}</strong>
                                                    </c:if>
                                                    상세 주소 <input type="text" style="margin-top: 15px;"
                                                                 value="${orderInfo.receiver_otherAddress}"
                                                                 class="form-control rounded-0 height-4 px-4"
                                                                 name="receiver_otherAddress" id="receiver_otherAddress" placeholder="상세주소">
                                                    <br />
                                                    <c:if test="${!empty errorMap}">
                                                        <strong style="color: red;">${errorMap.otherAddress}</strong>
                                                    </c:if>
                                                </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="mb-5 pb-4" style="padding-left: 5.5rem;">
                                    <h5 style="margin-bottom: 1.5rem;">배송상태 변경</h5>
                                    <c:forEach items="${orderStatus}" var="statusInfo">
                                        <c:choose>
                                            <c:when test="${orderInfo.status_code eq statusInfo.status_code}">
                                                <label style="margin-right: 1rem;">
                                                    <input type="radio" name="status_code" value="${statusInfo.status_code}" checked>
                                                        ${statusInfo.status}
                                                </label>
                                            </c:when>
                                            <c:otherwise>
                                                <label style="margin-right: 1rem;">
                                                    <input type="radio" name="status_code" value="${statusInfo.status_code}">
                                                        ${statusInfo.status}
                                                </label>
                                            </c:otherwise>

                                        </c:choose>
                                    </c:forEach>

                                </div>
                                    <input type="hidden" name="order_no" value="${orderInfo.order_no}">
                                    <button type="submit" class="btn btn-outline-primary" style="float: left; margin-top: 1rem;">주문 정보 변경</button>
                                    <button type="button" class="btn btn-outline-danger" onclick="history.back()" style="float: left; margin-top: 1rem; margin-left: 1rem;">취소</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Meta-BookStore 2022</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/js/demo/datatables-demo.js"></script>

<!-- 주소를 업데이트 하는 경우 -->
<script src="/js/admin/updateOrder.js"></script>

</body>

</html>