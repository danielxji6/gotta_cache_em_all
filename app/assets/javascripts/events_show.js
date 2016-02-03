$(document).ready(function (){
	if ($(".events").length > 0) {
		map = new google.maps.Map(document.getElementById('map'), {
		  center: {lat: 37.758712, lng: -122.444130},
		  zoom: 11
		});

		var coords = [];
		$(".event_coords").each(function () {
			coords.push($(this).data('coords'));
		});

		coords.forEach(function (ele) {
			lat_long = ele.split(",");
			new google.maps.Marker({
				position: {lat : parseFloat(lat_long[0]), lng: parseFloat(lat_long[1])},
				map: map,
				title: ele
			});
		});
	}
});
	