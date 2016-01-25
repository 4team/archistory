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

var lat = ${lat}-0.02;
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
            var adminno = getParameter('adminno');
            
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

