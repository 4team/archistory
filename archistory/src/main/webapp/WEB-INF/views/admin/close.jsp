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
<h1>${lat}</h1>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script>


var lat = ${lat};
var lng = ${lng};
var height;
var map;
var geocoder = new google.maps.Geocoder;
closeMap();

function closeMap(){

    (function initMap() {
        console.log(lat, lng);
        map = new google.maps.Map(document.getElementById('closeMap'), {
            center: new google.maps.LatLng(lat, lng),
            mapTypeControl:false,
            zoom: 14
        });


    })();

    google.maps.event.addListener(map, 'zoom_changed', function() {
        height = map.getZoom();

        var position = map.getCenter();

        var lat = position.lat()+2;
        var lng = position.lng();

        if(height<7){
            google.maps.event.clearListeners(map,'zoom_changed');
            self.location = "http://14.32.66.127:4000/admin/login_success";
        }
    });

    map.addListener('click',function(event){
        console.log(event.latLng.lat());
        var lat = event.latLng.lat();
        var lng = event.latLng.lng();

        geocoder.geocode({'location':event.latLng},function(result){
       
            var length = result.length;
            var nation = result[length-1].formatted_address;
            var adminno = ${adminno};
            
            if(nation == '대한민국'){
                console.log('대한민국 지도로 이동');
                self.location = "http://14.32.66.127:4000/admin/korea?adminno="+adminno+"&lat="+lat+"&lng="+lng+"&height="+height;
            }else{
                console.log('구글지도로 다른 나라의 지도표시');
                self.location = "otherNation.html?lat="+lat+"&lng="+lng;
            }

        });
    });


}


</script>

</body>
</html>