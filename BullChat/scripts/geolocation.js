$(document).ready(function(){
	$.get("http://ipinfo.io", function (response) {
		var geoLoc = response.loc.split(','); var title = "";
		if(response.country){ title += response.country; }
		if(response.city){ title += " - " + response.city; }
		google.maps.event.addDomListener(window, 'load', initialize(geoLoc[0],geoLoc[1], title));
	}, "jsonp");

	function initialize(lat, lng, title) {

	    var markers = [
	        {
	            "title": title,
	            "lat": lat,
	            "lng": lng,
	            "description": 'Move the pin over your neighborhood!'
	        }
	    ];

		var mapOpt = {
			center:new google.maps.LatLng(lat, lng),
			zoom: 13,
			mapTypeId:google.maps.MapTypeId.ROADMAP };

        var infoWindow = new google.maps.InfoWindow();
        var latlngbounds = new google.maps.LatLngBounds();
        var geocoder = geocoder = new google.maps.Geocoder();
		var map = new google.maps.Map(document.getElementById("dvMap"), mapOpt);

		var data = markers[0];

        var myLatlng = new google.maps.LatLng(data.lat, data.lng);

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: data.title,
            draggable: true,
            animation: google.maps.Animation.DROP
        });

        (function (marker, data) {
            google.maps.event.addListener(marker, "click", function (e) {
                infoWindow.setContent(data.description);
                infoWindow.open(map, marker);
            });

			google.maps.event.addListener(marker, 'dragend', function() {
				geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {
					if (status == google.maps.GeocoderStatus.OK) {
						if (results[0]) {
							console.log(results[0].formatted_address);
							console.log(marker.getPosition().lat());
							console.log(marker.getPosition().lng());
							marker.setAnimation(google.maps.Animation.DROP);
							infoWindow.setContent(results[0].formatted_address);
                			infoWindow.open(map, marker);
						}
					}
				});
			});
        })(marker, data);
        latlngbounds.extend(marker.position);
		var bounds = new google.maps.LatLngBounds();
	}
});