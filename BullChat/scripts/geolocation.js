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
        
       geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
            	getGeoValues(results, marker);
            }
        });
        
        (function (marker, data) {
            google.maps.event.addListener(marker, "click", function (e) {
                infoWindow.setContent(data.description);
                infoWindow.open(map, marker);
            });

			google.maps.event.addListener(marker, 'dragend', function() {
				geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {
					if (status == google.maps.GeocoderStatus.OK) {
						getGeoValues(results, marker);
						marker.setAnimation(google.maps.Animation.DROP);
						infoWindow.setContent(results[0].formatted_address);
            			infoWindow.open(map, marker);
					}
				});
			});
        })(marker, data);
        latlngbounds.extend(marker.position);
		var bounds = new google.maps.LatLngBounds();
	}
	
});

function getGeoValues(results, marker){
	var userCity = "", userRegion = "", userCountry = "";
    if (results[1]) {
        var arrAddress = results;
        $.each(arrAddress, function(i, address_component) {
        	if (address_component.types[0] == "locality") {
        		userCity = address_component.address_components[0].long_name;
        	}        	
	        if (address_component.types[0] == "administrative_area_level_1") {
	        	userRegion = address_component.address_components[0].long_name;
	        }
	        if (address_component.types[0] == "country") {
                userCountry = address_component.address_components[0].long_name;
            }
        
        });
    }
    if (results[0]) {
    	updateAddress(userCity, userRegion, userCountry, results[0].formatted_address, marker.getPosition().lat(), marker.getPosition().lng());
	}
}

function updateAddress(city, region, country, address, latitude, longitude){
	$('#city').val(city);
	$('#region').val(region);
	$('#country').val(country);
	$('#address').val(address);
	$('#longitude').val(latitude);
	$('#latitude').val(longitude);
}

function getCity(results){
    if (results[1]) {
        var arrAddress = results;
        // iterate through address_component array
        $.each(arrAddress, function(i, address_component) {
        	if (address_component.types[0] == "locality") {
        		itemLocality = address_component.address_components[0].long_name;
        	}
        });

    }
}