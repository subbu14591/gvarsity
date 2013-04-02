$(document).ready(function () {

    var el = $("#[CLIENTID]");
    el.empty();

    var pos = new google.maps.LatLng(-34.397, 150.644);

    var myOptions = {
        center: pos,
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("[CLIENTID]"), myOptions);

    [ISREADONLY]
    var marker = new google.maps.Marker({
        position: pos,
        map: map
    });
    [/ISREADONLY]

    [ISREADONLY=FALSE]
    var marker = new google.maps.Marker({
        position: pos,
        map: map,
        draggable: true
    });

    // Listen to gmap move/drag event
    google.maps.event.addListener(map, "moveend", function () {
        if (marker) {
            marker.setLocation(map.getCenter());
        }
    });

    // Marker drag end event
    google.maps.event.addListener(marker, "dragend", function () {
        alert('Drag!');
        var eLatLng = $("#[GEOLATLNGCONTROL]");
        if (eLatLng) {
            // Get pin location
            var loc = marker.getPoint();
            // Set geolocation control value
            eLatLng.val(loc.lat().toFixed(5) + "," + loc.lng().toFixed(5));
            // Center map
            map.panTo(loc);
        }
    });

    // Attach to clear control click event
    $("#[CLEARCONTROL]").click(function() {
            
        var eLatLng = $("#[GEOLATLNGCONTROL]");
        if (eLatLng) {
            eLatLng.val('');
        }

    });

    [/ISREADONLY]

});