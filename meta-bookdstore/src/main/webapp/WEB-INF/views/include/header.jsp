<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<header>
        <img class="header__logo" src="/images/meta-logo.png" alt="logo">
        <div class="header__center">
            <h1>Meta BookStore</h1>
            <div class="header__center-search">
            <input type="text" name="search">
            <input type="submit">
            </div>
        </div>
        <div class="header__buttons">
            <button type="button" class="btn btn-info">로그인</button>
            <button type="button" class="btn btn-info">회원가입</button>
        </div>
    </header>