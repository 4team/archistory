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
    <title>= Archistory(USER) = StepMode </title>
</head>
<style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }
    #map{
        width: 100%;
        height: 100%;
    }
    .modal-title{
        text-align : center;
    }
    .modal-dialog{
        max-width:500px;

    }
    #questionDiv{
        display: none;
    }
    #selectBox{
        display: none;
    }

    #moquestionDiv{
        display: none;
    }
    #moselectBox{
        display: none;
    }
    #listModal1{
        margin-top:50px;
        margin-left:20px;
    }
    #list{
        position : absolute;
        padding : 10px;
        z-index: 400;
        boarder: 1px solid black;
        boarder-radius : 10px;
        background-color:  #FFF;
        top: 80px;
        left : 15px;
        width : 200px;
        height:400px;
        overflow-y:scroll;

    }

    #listBottom{
        margin-bottom: 5px;
        float: right;
    }
    #order{
        width:33px;
        height:33px;
        float:left;
    }
    #moorder{
        width:33px;
        height:33px;
        float:left;
    }
    #eventName{
        width:420px;
    }
    .fileDrop {
        width: 60%;
        height: 60px;
        border: 2px dotted black;
        border-radius: 10px;
        background-color: powderblue;
        margin-top:10px;
        margin-bottom:10px;
    }
    li{
        list-style: none;
        margin-bottom: 15px;
    }

    small{
        float:right;
        font-size:smaller;
    }
	.img{
	 margin-bottom:10px;
	float:left;
	}
	.x{
	text-align:right;
	}
    ::-webkit-scrollbar {
        width: 10px;
    }

    ::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        border-radius: 10px;
    }

    ::-webkit-scrollbar-thumb {
        border-radius: 10px;
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5);
    }

    .glyphicon{
        display: inline;
        margin : 3px;
    }
    .gly{
        float:right;
    }
    
 	 .blink_me{
        position:absolute;
        top:10px;
        left:100px;
        z-index:600;
    }
    
    
    
    .node {
            position: absolute;
            background-image: url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png);
            cursor: pointer;
            width: 30px;
            height: 30px;
        }

        .tooltip {
            background-color: #fff;
            position: absolute;
            border: 2px solid #333;
            font-size: 25px;
            font-weight: bold;
            padding: 3px 5px 0;
            left: 65px;
            top: 14px;
            border-radius: 5px;
            white-space: nowrap;
            display: none;
        }

        .tracker {
            position: absolute;
            margin: -35px 0 0 -30px;
            display: none;
            cursor: pointer;
            z-index: 3;
        }

        .icon {
            position: absolute;
            left: 6px;
            top: 9px;
            width: 48px;
            height: 48px;
            background-image: url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/sign-info-48.png);
        }

        .balloon {
            position: absolute;
            width: 60px;
            height: 60px;
            background-image: url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/balloon.png);
            -ms-transform-origin: 50% 34px;
            -webkit-transform-origin: 50% 34px;
            transform-origin: 50% 34px;
        }
        
        
</style>

<script type="text/javascript" src="/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=66fca768fabb8a1e238c3ac76f9c9499"></script>
<!-- on/off toggle 이용하기 위함 -->
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.0/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.0/js/bootstrap-toggle.min.js"></script>
<body>

<div id="map"></div>


<script>
var markers = [];
var lat = ${lat};
var lng = ${lng};
var routeno = ${routeno};
var eventLi="";
var routename = ${routename};
var eventno = 1;
var events = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커 이미지 생성
var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
var imageSize = new daum.maps.Size(24, 35);

var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);



function addMarker(event){

var marker = new daum.maps.Marker({
    title: '<div class="title">' + event.title+'<font class="text"> [' + event.eventno +']</div> <br>'+event.content + '</font><br><br>',
    position: new daum.maps.LatLng(event.lat,event.lng)
});
console.log("addmarker들어옴");
marker.setMap(map);
markers.push(marker);
};


function getEventList(){
	console.log("getEventList가 호출되어 시작됨.");
	
    $.getJSON("http://14.32.66.127:4000/event/elist?routeno="+routeno,function(data){
        var list = $(data);
        eventLi="";
        console.log(data);
        
        list.each(function(idx,value){
            var event= this;
            addMarker(event);
        });
    });
}

getEventList();


/* //------------------------------- Geolocation -----------------------------------

//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">나 요기똥</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
}    


 */
/////////////////////////////////////////////////////////////////////////////////////

    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {

            var lat = position.coords.latitude, // 위도
                    lon = position.coords.longitude; // 경도

            var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                    message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
          //  displayMarker(locPosition, message);

            // 툴팁을 노출하는 마커를 생성합니다.
            var marker1 = new TooltipMarker(locPosition, '내 위치!!!!');
            marker1.setMap(myLocation);

            // MarkerTracker를 생성합니다.
            var markerTracker1 = new MarkerTracker(myLocation, marker1);

            // marker의 추적을 시작합니다.
            markerTracker1.run();

        });

    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        var locPosition = new daum.maps.LatLng(33.450701, 126.570667),
                message = 'geolocation을 사용할수 없어요..'

        displayMarker(locPosition, message);

    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new daum.maps.Marker({
            map: myLocation,
            position: locPosition
        });

        var iwContent = message, // 인포윈도우에 표시할 내용
                iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new daum.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });

        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(myLocation, marker);

        // 지도 중심좌표를 접속위치로 변경합니다
        myLocation.setCenter(locPosition);
    }



    /**
     * AbstractOverlay를 상속받을 객체를 선언합니다.
     */
    function TooltipMarker(position, tooltipText) {
        this.position = position;
        var node = this.node = document.createElement('div');
        node.className = 'node';

        var tooltip = document.createElement('div');
        tooltip.className = 'tooltip',

                tooltip.appendChild(document.createTextNode(tooltipText));
        node.appendChild(tooltip);

        // 툴팁 엘리먼트에 마우스 인터렉션에 따라 보임/숨김 기능을 하도록 이벤트를 등록합니다.
        node.onmouseover = function() {
            tooltip.style.display = 'block';
        };
        node.onmouseout = function() {
            tooltip.style.display = 'none';
        };
    }

    // AbstractOverlay 상속. 프로토타입 체인을 연결합니다.
    TooltipMarker.prototype = new daum.maps.AbstractOverlay;

    // AbstractOverlay의 필수 구현 메소드.
    // setMap(map)을 호출했을 경우에 수행됩니다.
    // AbstractOverlay의 getPanels() 메소드로 MapPanel 객체를 가져오고
    // 거기에서 오버레이 레이어를 얻어 생성자에서 만든 엘리먼트를 자식 노드로 넣어줍니다.
    TooltipMarker.prototype.onAdd = function() {
        var panel = this.getPanels().overlayLayer;
        panel.appendChild(this.node);
    };

    // AbstractOverlay의 필수 구현 메소드.
    // setMap(null)을 호출했을 경우에 수행됩니다.
    // 생성자에서 만든 엘리먼트를 오버레이 레이어에서 제거합니다.
    TooltipMarker.prototype.onRemove = function() {
        this.node.parentNode.removeChild(this.node);
    };

    // AbstractOverlay의 필수 구현 메소드.
    // 지도의 속성 값들이 변화할 때마다 호출됩니다. (zoom, center, mapType)
    // 엘리먼트의 위치를 재조정 해 주어야 합니다.
    TooltipMarker.prototype.draw = function() {
        // 화면 좌표와 지도의 좌표를 매핑시켜주는 projection객체
        var projection = this.getProjection();

        // overlayLayer는 지도와 함께 움직이는 layer이므로
        // 지도 내부의 위치를 반영해주는 pointFromCoords를 사용합니다.
        var point = projection.pointFromCoords(this.position);

        // 내부 엘리먼트의 크기를 얻어서
        var width = this.node.offsetWidth;
        var height = this.node.offsetHeight;

        // 해당 위치의 정중앙에 위치하도록 top, left를 지정합니다.
        this.node.style.left = (point.x - width/2) + "px";
        this.node.style.top = (point.y - height/2) + "px";
    };

    // 좌표를 반환하는 메소드
    TooltipMarker.prototype.getPosition = function() {
        return this.position;
    };

    /**
     * 지도 영역 외부에 존재하는 마커를 추적하는 기능을 가진 객체입니다.
     * 클리핑 알고리즘을 사용하여 tracker의 좌표를 구하고 있습니다.
     */
    function MarkerTracker(map, target) {
        // 클리핑을 위한 outcode
        var OUTCODE = {
            INSIDE: 0, // 0b0000
            TOP: 8, //0b1000
            RIGHT: 2, // 0b0010
            BOTTOM: 4, // 0b0100
            LEFT: 1 // 0b0001
        };

        // viewport 영역을 구하기 위한 buffer값
        // target의 크기가 60x60 이므로
        // 여기서는 지도 bounds에서 상하좌우 30px의 여분을 가진 bounds를 구하기 위해 사용합니다.
        var BOUNDS_BUFFER = 30;

        // 클리핑 알고리즘으로 tracker의 좌표를 구하기 위한 buffer값
        // 지도 bounds를 기준으로 상하좌우 buffer값 만큼 축소한 내부 사각형을 구하게 됩니다.
        // 그리고 그 사각형으로 target위치와 지도 중심 사이의 선을 클리핑 합니다.
        // 여기서는 tracker의 크기를 고려하여 40px로 잡습니다.
        var CLIP_BUFFER = 40;

        // trakcer 엘리먼트
        var tracker = document.createElement('div');
        tracker.className = 'tracker';

        // 내부 아이콘
        var icon = document.createElement('div');
        icon.className = 'icon';

        // 외부에 있는 target의 위치에 따라 회전하는 말풍선 모양의 엘리먼트
        var balloon = document.createElement('div');
        balloon.className = 'balloon';

        tracker.appendChild(balloon);
        tracker.appendChild(icon);

        myLocation.getNode().appendChild(tracker);

        // traker를 클릭하면 target의 위치를 지도 중심으로 지정합니다.
        tracker.onclick = function() {
            myLocation.setCenter(target.getPosition());
            setVisible(false);
        };

        // target의 위치를 추적하는 함수
        function tracking() {
            var proj = myLocation.getProjection();

            // 지도의 영역을 구합니다.
            var bounds = myLocation.getBounds();

            // 지도의 영역을 기준으로 확장된 영역을 구합니다.
            var extBounds = extendBounds(bounds, proj);

            // target이 확장된 영역에 속하는지 판단하고
            if (extBounds.contain(target.getPosition())) {
                // 속하면 tracker를 숨깁니다.
                setVisible(false);
            } else {
                // target이 영역 밖에 있으면 계산을 시작합니다.


                // 지도 bounds를 기준으로 클리핑할 top, right, bottom, left를 재계산합니다.
                //
                //  +-------------------------+
                //  | Map Bounds              |
                //  |   +-----------------+   |
                //  |   | Clipping Rect   |   |
                //  |   |                 |   |
                //  |   |        *       (A)  |     A
                //  |   |                 |   |
                //  |   |                 |   |
                //  |   +----(B)---------(C)  |
                //  |                         |
                //  +-------------------------+
                //
                //        B
                //
                //                                       C
                // * 은 지도의 중심,
                // A, B, C가 TooltipMarker의 위치,
                // (A), (B), (C)는 각 TooltipMarker에 대응하는 tracker입니다.
                // 지도 중심과 각 TooltipMarker를 연결하는 선분이 있다고 가정할 때,
                // 그 선분과 Clipping Rect와 만나는 지점의 좌표를 구해서
                // tracker의 위치(top, left)값을 지정해주려고 합니다.
                // tracker 자체의 크기가 있기 때문에 원래 지도 영역보다 안쪽의 가상 영역을 그려
                // 클리핑된 지점을 tracker의 위치로 사용합니다.
                // 실제 tracker의 position은 화면 좌표가 될 것이므로
                // 계산을 위해 좌표 변환 메소드를 사용하여 모두 화면 좌표로 변환시킵니다.

                // TooltipMarker의 위치
                var pos = proj.containerPointFromCoords(target.getPosition());

                // 지도 중심의 위치
                var center = proj.containerPointFromCoords(myLocation.getCenter());

                // 현재 보이는 지도의 영역의 남서쪽 화면 좌표
                var sw = proj.containerPointFromCoords(bounds.getSouthWest());

                // 현재 보이는 지도의 영역의 북동쪽 화면 좌표
                var ne = proj.containerPointFromCoords(bounds.getNorthEast());

                // 클리핑할 가상의 내부 영역을 만듭니다.
                var top = ne.y + CLIP_BUFFER;
                var right = ne.x - CLIP_BUFFER;
                var bottom = sw.y - CLIP_BUFFER;
                var left = sw.x + CLIP_BUFFER;

                // 계산된 모든 좌표를 클리핑 로직에 넣어 좌표를 얻습니다.
                var clipPosition = getClipPosition(top, right, bottom, left, center, pos);

                // 클리핑된 좌표를 tracker의 위치로 사용합니다.
                tracker.style.top = clipPosition.y + 'px';
                tracker.style.left = clipPosition.x + 'px';

                // 말풍선의 회전각을 얻습니다.
                var angle = getAngle(center, pos);

                // 회전각을 CSS transform을 사용하여 지정합니다.
                // 브라우저 종류에따라 표현되지 않을 수도 있습니다.
                // http://caniuse.com/#feat=transforms2d
                balloon.style.cssText +=
                        '-ms-transform: rotate(' + angle + 'deg);' +
                        '-webkit-transform: rotate(' + angle + 'deg);' +
                        'transform: rotate(' + angle + 'deg);';

                // target이 영역 밖에 있을 경우 tracker를 노출합니다.
                setVisible(true);
            }
        }

        // 상하좌우로 BOUNDS_BUFFER(30px)만큼 bounds를 확장 하는 함수
        //
        //  +-----------------------------+
        //  |              ^              |
        //  |              |              |
        //  |     +-----------------+     |
        //  |     |                 |     |
        //  |     |                 |     |
        //  |  <- |    Map Bounds   | ->  |
        //  |     |                 |     |
        //  |     |                 |     |
        //  |     +-----------------+     |
        //  |              |              |
        //  |              v              |
        //  +-----------------------------+
        //
        // 여기서는 TooltipMaker가 완전히 안보이게 되는 시점의 영역을 구하기 위해서 사용됩니다.
        // TooltipMarker는 60x60 의 크기를 가지고 있기 때문에
        // 지도에서 완전히 사라지려면 지도 영역을 상하좌우 30px만큼 더 드래그해야 합니다.
        // 이 함수는 현재 보이는 지도 bounds에서 상하좌우 30px만큼 확장한 bounds를 리턴합니다.
        // 이 확장된 영역은 TooltipMarker가 화면에서 보이는지를 판단하는 영역으로 사용됩니다.
        function extendBounds(bounds, proj) {
            // 주어진 bounds는 지도 좌표 정보로 표현되어 있습니다.
            // 이것을 BOUNDS_BUFFER 픽셀 만큼 확장하기 위해서는
            // 픽셀 단위인 화면 좌표로 변환해야 합니다.
            var sw = proj.pointFromCoords(bounds.getSouthWest());
            var ne = proj.pointFromCoords(bounds.getNorthEast());

            // 확장을 위해 각 좌표에 BOUNDS_BUFFER가 가진 수치만큼 더하거나 빼줍니다.
            sw.x -= BOUNDS_BUFFER;
            sw.y += BOUNDS_BUFFER;

            ne.x += BOUNDS_BUFFER;
            ne.y -= BOUNDS_BUFFER;

            // 그리고나서 다시 지도 좌표로 변환한 extBounds를 리턴합니다.
            // extBounds는 기존의 bounds에서 상하좌우 30px만큼 확장된 영역 객체입니다.
            return new daum.maps.LatLngBounds(
                    proj.coordsFromPoint(sw),proj.coordsFromPoint(ne));

        }


        // Cohen–Sutherland clipping algorithm
        // 자세한 내용은 아래 위키에서...
        // https://en.wikipedia.org/wiki/Cohen%E2%80%93Sutherland_algorithm
        function getClipPosition(top, right, bottom, left, inner, outer) {
            function calcOutcode(x, y) {
                var outcode = OUTCODE.INSIDE;

                if (x < left) {
                    outcode |= OUTCODE.LEFT;
                } else if (x > right) {
                    outcode |= OUTCODE.RIGHT;
                }

                if (y < top) {
                    outcode |= OUTCODE.TOP;
                } else if (y > bottom) {
                    outcode |= OUTCODE.BOTTOM;
                }

                return outcode;
            }

            var ix = inner.x;
            var iy = inner.y;
            var ox = outer.x;
            var oy = outer.y;

            var code = calcOutcode(ox, oy);

            while(true) {
                if (!code) {
                    break;
                }

                if (code & OUTCODE.TOP) {
                    ox = ox + (ix - ox) / (iy - oy) * (top - oy);
                    oy = top;
                } else if (code & OUTCODE.RIGHT) {
                    oy = oy + (iy - oy) / (ix - ox) * (right - ox);
                    ox = right;
                } else if (code & OUTCODE.BOTTOM) {
                    ox = ox + (ix - ox) / (iy - oy) * (bottom - oy);
                    oy = bottom;
                } else if (code & OUTCODE.LEFT) {
                    oy = oy + (iy - oy) / (ix - ox) * (left - ox);
                    ox = left;
                }

                code = calcOutcode(ox, oy);
            }

            return {x: ox, y: oy};
        }

        // 말풍선의 회전각을 구하기 위한 함수
        // 말풍선의 anchor가 TooltipMarker가 있는 방향을 바라보도록 회전시킬 각을 구합니다.
        function getAngle(center, target) {
            var dx = target.x - center.x;
            var dy = center.y - target.y ;
            var deg = Math.atan2( dy , dx ) * 180 / Math.PI;

            return ((-deg + 360) % 360 | 0) + 90;
        }

        // tracker의 보임/숨김을 지정하는 함수
        function setVisible(visible) {
            tracker.style.display = visible ? 'block' : 'none';
        }

        // Map 객체의 'zoom_start' 이벤트 핸들러
        function hideTracker() {
            setVisible(false);
        }

        // target의 추적을 실행합니다.
        this.run = function() {
            daum.maps.event.addListener(myLocation, 'zoom_start', hideTracker);
            daum.maps.event.addListener(myLocation, 'zoom_changed', tracking);
            daum.maps.event.addListener(myLocation, 'center_changed', tracking);
            tracking();
        };

        // target의 추적을 중지합니다.
        this.stop = function() {
            daum.maps.event.removeListener(myLocation, 'zoom_start', hideTracker);
            daum.maps.event.removeListener(myLocation, 'zoom_changed', tracking);
            daum.maps.event.removeListener(myLocation, 'center_changed', tracking);
            setVisible(false);
        };
    }
//////////////////////////////////////////////////////////////////////////////////////////
</script>

</body>
</html>