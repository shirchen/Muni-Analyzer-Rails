(
function init() {
	console.log("=======");
	   var neighborhoods = [
    new google.maps.LatLng(52.511467, 13.447179),
    new google.maps.LatLng(52.549061, 13.422975),
    new google.maps.LatLng(52.497622, 13.396110),
    new google.maps.LatLng(52.517683, 13.394393)
  ];

        
  function initialize() {
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var myOptions = {
      zoom: 8,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
        myOptions);

        //var inter = setInterval(addMarker, 500);
        markerArray = new Array(latlng, latlng, latlng);


        function drop() {
          for (var i =0; i < markerArray.length; i++) {
                        setTimeout(function() {
                        addMarker();
                        }, i * 500);
                }
        }
        
          function addMarker() {
                markers.push(new google.maps.Marker({
                position: neighborhoods[iterator],
                map: map,
                draggable: false,
                animation: google.maps.Animation.DROP
                }));
        iterator++;
        }


})()
