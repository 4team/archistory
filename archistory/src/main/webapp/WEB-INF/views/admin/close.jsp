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
    
    #status{
  		background-color:#FFF;
	    position:absolute;
	    font-size:12px;
	    width:150px;
	    height:20px;
	    z-index:4000;
	    margin-left:5px;
	    margin-top:5px;
    }
    
    
     #upper-login{
        	padding:5px;
       		position:absolute;
        	z-index:100;
        	right: 10px;
        	top:5px;
        }
        
    #adminInfo{
	   		position:absolute;
	   		display:none;
	   		background-color:#FFF;
	   		top:35px;
	   		right:6px;
	   		text-align:center;
	   		z-index:400;
	   		width:100px;
	   		height:70px;
	   	}
    </style>

	
</head>
<body>
<script src="/Cesium/js/jquery.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAjUYVhsr-9THi7kQIHS0azuS10hUB75AU"></script>

<div id="upper-login">
	<button type="button" id="myInfo" data-src="${adminno}" class="btn btn-primary btn-xs"><font face="verdana" size="2" >${name}님</font></button>
	<ul id="adminInfo">
  	 	<li><a id="myInfo">My Info</a></li>
    	<li><a href="/admin/logout">Logout</a></li>
    </ul>
</div>

<div id="closeMap"></div>
<div id="status">이곳에 루트를 생성! (Click)</div>





<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>




<script>

$("#closeMap").on("mousemove",function(e){
	$('#status').css("left",event.clientX);
	$('#status').css("top",event.clientY);
});

var adminno = ${adminno};
var lat = ${lat};
var lng = ${lng};
var height = 3;
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
        var lat = event.latLng.lat();
        var lng = event.latLng.lng();

        geocoder.geocode({'location':event.latLng},function(result){
       
            var length = result.length;
            var nation = result[length-1].formatted_address;
            
            if(nation == '대한민국'){
            	
                console.log('대한민국 지도로 이동');
                
                var $form = $('<form></form>');
                $form.attr('action', '/admin/korea');
                $form.attr('method', 'post');
                $form.appendTo('body');
                
                var a1 = $('<input type="hidden" value="'+ adminno +'" name="adminno">');
                var a2 = $('<input type="hidden" value="'+ lat +'" name="lat">');
                var a3 = $('<input type="hidden" value="'+ lng +'" name="lng">');
                var a4 = $('<input type="hidden" value="'+ height +'" name="height">');
                console.log(adminno,lat,lng,height);
                
                $form.append(a1).append(a2).append(a3).append(a4);
                $form.submit();
     
                
            }else{
                console.log('구글지도로 다른 나라의 지도표시');
                
                var $form = $('<form></form>');
                $form.attr('action', '/admin/other');
                $form.attr('method', 'post');
                $form.appendTo('body');
                
                var a1 = $('<input type="hidden" value="'+ adminno +'" name="adminno">');
                var a2 = $('<input type="hidden" value="'+ lat +'" name="lat">');
                var a3 = $('<input type="hidden" value="'+ lng +'" name="lng">');
                var a4 = $('<input type="hidden" value="'+ height +'" name="height">');
                console.log(adminno,lat,lng,height);
                
                $form.append(a1).append(a2).append(a3).append(a4);
                $form.submit();
     
            }

        });
    });


}


</script>

</body>
</html>