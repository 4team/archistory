/**
 * Created by Administrator on 2016-01-11.
 */

var getParameter = function (param) {

    var returnValue;
    var url = location.href;
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
    for (var i = 0; i < parameters.length; i++) {
        var varName = parameters[i].split('=')[0];
        if (varName.toUpperCase() == param.toUpperCase()) {
            returnValue = parameters[i].split('=')[1];
            return decodeURIComponent(returnValue);
        }
    }
};

var lat = getParameter('lat');
var lng = getParameter('lng');
var map;
closeMap();

function closeMap(){

    (function initMap() {
        console.log(lat, lng);
        map = new google.maps.Map(document.getElementById('closeMap'), {
            center: new google.maps.LatLng(lat, lng),
            zoom: 8
        });


    })();

    google.maps.event.addListener(map, 'zoom_changed', function() {
        var zoom = map.getZoom();
        console.log("세부맵의 줌사이즈 : ",zoom);

        var position = map.getCenter();

        var lat = position.lat()+2;
        var lng = position.lng();

        if(zoom<7){
            google.maps.event.clearListeners(map,'zoom_changed');
            $("#closeMap").css({"display":"none"});
            self.location = "index.html?lat="+lat+"&lng="+lng;
        }
    });
}
