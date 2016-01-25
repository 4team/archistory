<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<?php
    header('X-Frame-Options: GOFORIT'); 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>= Archistory(ADMIN) = close Map</title>
    <style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }

    #closeMap{
        width:100%;
        height: 100%;
        z-index: 3000;
    }
    </style>
</head>
<body>
    <script src="/Cesium/js/jquery.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAjUYVhsr-9THi7kQIHS0azuS10hUB75AU"></script>

<div id="closeMap"></div>


<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script src="/Cesium/js/close.js"></script>

</body>
</html>