<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Meta-Book Admin</title>

    <!-- Custom fonts for this template -->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- 직접 만든 css -->
    <link rel="stylesheet" href="/css/member/mypage.css">
    <link rel="stylesheet" href="/css/admin/memberUpdate.css">

    <style>
        .telDiv{
            display: flex;
        }

        .tel_form{
            width: 15%;
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
            <div class="container-fluid" style="padding-left: 19.5rem; padding-right: 19.5rem;">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Member Update Page</h1>
                <p class="mb-4">회원 관리 페이지 입니다. </p>

                <div>
                    <div class="font-weight-medium font-size-22 mb-4 pb-xl-1">회원 정보 수정</div>
                    <form:form action="/admin/memberUpdate" method="post" modelAttribute="memberUpdateAdminDto" onsubmit="return checkSubmit();">
                        <form:input path="m_no" type="hidden" value="${memberInfo.m_no}" />
                        <div class="row">
                            <div class="col-md-12 mb-4">
                                <div class="js-form-message">
                                    <label class="form-label">아이디 </label>
                                    <input type="text" style="width: 30%;" id="id" name="id" class="form-control rounded-0 height-4 px-4"
                                           readonly="true" value="${memberInfo.id}" />
                                </div>
                            </div>
                            <div class="col-md-12 mb-4">
                                <div class="js-form-message">
                                    <label class="form-label">새로운 비밀번호</label>
                                    <input type="password" style="width: 30%;" class="form-control rounded-0 height-4 px-4"
                                        name="newpassword" id="newpassword" placeholder="새로운 비밀번호를 입력하세요">
                                </div>
                                <c:if test="${!empty errorMap}">
                                    <strong style="color: red;">${errorMap.newpassword}</strong>
                                </c:if>
                            </div>
                            <div class="col-md-12 mb-4">
                                <div class="js-form-message">
                                    <label class="form-label">이름 </label>
                                    <input type="text" style="width: 30%;" name="name" id="name"
                                           class="form-control rounded-0 height-4 px-4" value="${memberInfo.name}" />
                                </div>
                            </div>
                            <div class="col-md-12 mb-4">
                                <div class="js-form-message js-focus-state">
                                    <label class="form-label">전화번호</label>
                                    <div class="telDiv">
                                        <form:input path="tel1" type="text" maxlength="3" size="4"
                                                    id="tel1" onkeyup="to_auto_tel('tel1','tel2',3);"
                                                    class="tel_form form-control rounded-0 height-4 px-4"
                                                    value="${fn:split(memberInfo.phone, '-')[0]}"/>
                                        -
                                        <form:input path="tel2" type="text" maxlength="4" size="5"
                                                    id="tel2" onkeyup="to_auto_tel('tel2','tel3',4);"
                                                    class="tel_form form-control rounded-0 height-4 px-4"
                                                    value="${fn:split(memberInfo.phone, '-')[1]}"/>
                                        -
                                        <form:input path="tel3" type="text" maxlength="4" size="5"
                                                    id="tel3"
                                                    class="tel_form form-control rounded-0 height-4 px-4"
                                                    value="${fn:split(memberInfo.phone, '-')[2]}"/>
                                        <input type="hidden" name="phone" id="phone" />
                                    </div>
                                </div>
                                <c:if test="${!empty errorMap}">
                                    <strong style="color: red;">${errorMap.phone}</strong>
                                </c:if>

                            </div>
                            <div class="col-md-12 mb-4">
                                <div class="js-form-message">
                                    <label class="form-label">이메일</label> <br>
                                    <form:input path="email1" type="text"
                                                style="width: 30%; display: inline-block;"
                                                class="form-control rounded-0 height-4 px-4" name="email1"
                                                id="email1" placeholder="이메일을 입력"
                                                value="${fn:split(memberInfo.email,'@')[0]}"/>
                                    @
                                    <form:input path="emailDomain" type="text"
                                                class="form-control rounded-0 height-4 px-4"
                                                id="emailDomain" name="emailDomain"
                                                style="width: 30%; display: inline-block;"
                                                value="${fn:split(memberInfo.email,'@')[1]}"/>
                                    <select name="emailDomain" id="emailDomain"
                                            onChange="selectEmailChange(this.value);" title="직접입력"
                                            style="width: 20%;">
                                        <option value="">직접입력</option>
                                        <option value="hanmail.net">hanmail.net</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                                        <option value="hotmail.com">hotmail.com</option>
                                        <option value="paran.com">paran.com</option>
                                        <option value="nate.com">nate.com</option>
                                        <option value="google.com">google.com</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="empal.com">empal.com</option>
                                        <option value="korea.com">korea.com</option>
                                        <option value="freechal.com">freechal.com</option>
                                    </select>
                                </div>
                                <c:if test="${!empty errorMap}">
                                    <strong style="color: red;">${errorMap.email}</strong>
                                </c:if>
                                <input type="hidden" name="email" id="email" />
                            </div>
                            <div class="col-md-12 mb-4">
                                <div class="js-form-message">
                                    <label class="form-label">주소</label>
                                    <div class="addrBtn" style="margin-bottom: 10px;">
                                        <input type="text" style="width: 30%"
                                               value="${memberInfo.zipcode}"
                                               class="form-control rounded-0 height-2 px-2"
                                               name="zipcode" id="zipcode" placeholder="우편번호" readonly>
                                        <button type="button" class="btn btn-info" onClick="goPopup();" style="margin-top: 10px;">주소검색</button>
                                    </div>
                                    <c:if test="${!empty errorMap}">
                                        <strong style="color: red;">${errorMap.zipcode}</strong>
                                    </c:if>
                                    도로명 주소 <input type="text" style="margin-top: 15px; margin-bottom: 15px;"
                                                  value="${memberInfo.roadAddress}"
                                                  class="form-control rounded-0 height-4 px-4"
                                                  name="roadAddress" id="roadAddress"
                                                  placeholder="주소검색을 해주세요" readonly>
                                    <c:if test="${!empty errorMap}">
                                        <strong style="color: red;">${errorMap.roadAddress}</strong>
                                    </c:if>
                                    상세 주소 <input type="text" style="margin-top: 15px;"
                                                 value="${memberInfo.otherAddress}"
                                                 class="form-control rounded-0 height-4 px-4"
                                                 name="otherAddress" id="otherAddress" placeholder="상세주소">
                                    <br />
                                    <c:if test="${!empty errorMap}">
                                        <strong style="color: red;">${errorMap.otherAddress}</strong>
                                    </c:if>
                                </div>
                            </div>

                            <div class="col-md-12 mb-4">
                                <div style="margin-bottom: 10px;">
                                    관리자 권한 설정
                                </div>
                                <label class="switch">
                                    <c:choose>
                                        <c:when test="${memberInfo.grade eq 'ADMIN'}">
                                            <input type="checkbox" onclick="toggle(this)" checked>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="checkbox" onclick="toggle(this)">
                                        </c:otherwise>
                                    </c:choose>
                                    <span class="slider round"></span>
                                </label>
                                <input type="hidden" id="grade" name="grade">
                            </div>

                        </div>


                        <button type="submit" class="btn btn-outline-primary" style="float: left;">회원 정보 수정</button>
                        <button type="button" class="btn btn-outline-danger" onclick="history.back()" style="float: left; margin-left: 1rem;">취소</button>

                    </form:form>
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

<script src="/js/admin/updateMember.js"></script>

</body>

</html>