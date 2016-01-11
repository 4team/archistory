/**
 * Created by Bitcamp on 2016-01-08.
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


function sleep(delay) {
    var start = new Date().getTime();
    while (new Date().getTime() < start + delay);
}


var lat = getParameter("lat");
var lng = getParameter("lng")
console.log(lat);

if(lat !== undefined) {
    viewer.camera.setView({
        destination : Cesium.Cartesian3.fromDegrees(
            lng,
            lat,
            1900000
        )
    });
}else {


//초기 위치 읽어내서 지구를 이동시킨다.
    navigator.geolocation.getCurrentPosition(success, error);

    function success(position) {
        console.log(position);
        viewer.camera.flyTo({
            destination: Cesium.Cartesian3.fromDegrees(
                position.coords.longitude,
                position.coords.latitude,
                1800000
            )
        });
    }

    function error(err) {
        console.log(err.code + err.message);
    }

}