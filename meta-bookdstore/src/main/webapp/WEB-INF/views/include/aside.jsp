<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



    <!-- Categories Sidebar Navigation -->
    <aside id="sidebarContent2" class="u-sidebar u-sidebar__md u-sidebar--left" aria-labelledby="sidebarNavToggler2">
        <div class="u-sidebar__scroller js-scrollbar">
            <div class="u-sidebar__container">
                <div class="u-header-sidebar__footer-offset">
                    <!-- Content -->
                    <div class="u-sidebar__body">
                        <div class="u-sidebar__content u-header-sidebar__content">
                            <!-- Title -->
                            <header class="border-bottom px-4 px-md-5 py-4 d-flex align-items-center justify-content-between">
                                <h2 class="font-size-3 mb-0">SHOP BY CATEGORY</h2>

                                <!-- Toggle Button -->
                                <div class="d-flex align-items-center">
                                    <button type="button" class="close ml-auto"
                                        aria-controls="sidebarContent2"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        data-unfold-event="click"
                                        data-unfold-hide-on-scroll="false"
                                        data-unfold-target="#sidebarContent2"
                                        data-unfold-type="css-animation"
                                        data-unfold-animation-in="fadeInLeft"
                                        data-unfold-animation-out="fadeOutLeft"
                                        data-unfold-duration="500">
                                        <span aria-hidden="true"><i class="fas fa-times ml-2"></i></span>
                                    </button>
                                </div>
                                <!-- End Toggle Button -->
                            </header>
                            <!-- End Title -->

                            <div class="border-bottom">
                                <div class="zeynep pt-4">
                                    <ul>

                                        <li class="has-submenu">
                                            <a href="/book/list?cate_no=100" data-submenu="art-photo">Fiction</a>

                                        </li>

                                        <li class="has-submenu">
                                            <a href="/book/list?cate_no=110" data-submenu="biography">Poetry</a>
                                        </li>

                                        <li class="has-submenu">
                                            <a href="/book/list?cate_no=120" data-submenu="children">Humanity</a>
                                        </li>

                                        <li class="has-submenu">
                                            <a href="/book/list?cate_no=130" data-submenu="computers">House</a>
                                        </li>

                                        <li class="has-submenu">
                                            <a href="/book/list?cate_no=140" data-submenu="cookbook">Health</a>
                                        </li>

                                        <li class="has-submenu">
                                            <a href="/book/list?cate_no=150" data-submenu="education">Leisure</a>
                                        </li>

                                        <li class="has-submenu">
                                            <a href="/book/list?cate_no=160" data-submenu="health">Economy</a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Content -->
                </div>
            </div>
        </div>
    </aside>