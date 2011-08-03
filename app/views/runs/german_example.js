console.log("==============>");

var berlin = new google.maps.LatLng(37.785816, -122.410186);
	
  var markers = [];
  var iterator = 0;

  var map;
  var mapOptions = {
      zoom: 14,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      center: berlin
    };


function init() {  
	//loadPoints();
    map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
	//console.log("nbrs: ", neighborhoods);
	document.getElementById("bus_id").innerHTML = bus_id;
	drop();
}
	// Removes the overlays from the map, but keeps them in the array
function clearOverlays(j) {
  if (markers) {
    for (var i = j-100; i < j+1 ; i++) {
	if (markers[i]) {
      		markers[i].setMap(null);
	}
    }
  }
}
function clearAllOverlays() {
  if (markers) {
    for (i in markers) {
      markers[i].setMap(null);
    }
  }
}


  function drop() {
    for (var i = 0; i < neighborhoods.length; i++) {
      setTimeout(function(i, total) {
        addMarker();
	if (i % 100 == 0) {
		 clearOverlays(i);
	}
	document.getElementById("on_marker").innerHTML = i + "/" + total;
      }, i * 200, i, neighborhoods.length);
    }
  }

  function addMarker() {
    markers.push(new google.maps.Marker({
      position: neighborhoods[iterator],
      map: map,
      draggable: false,
      animation: google.maps.Animation.DROP
    }));

  	var d = new Date(parseFloat(times[iterator]*1000));
	
	document.getElementById("time_stamp").innerHTML = d.toLocaleString();
    iterator++;
  }
