jQuery(document).ready(function () {

    var el = jQuery("#[CLIENTID]");

    el.empty();
                
    var map = new Microsoft.Maps.Map(document.getElementById('[CLIENTID]'), { credentials: '[SETTINGS:MapKey]', mapTypeId: Microsoft.Maps.MapTypeId.aerial, width: el.width(), height: el.height() });
                
    var loc = new Microsoft.Maps.Location(47.609771, -122.2321543125);
    [HASVALUE]
    loc = new Microsoft.Maps.Location([VALUE]);
    [/HASVALUE]
        
    [ISREADONLY]
    var pushpin = new Microsoft.Maps.Pushpin(loc, null);
    [/ISREADONLY]

    [ISREADONLY=FALSE]
        
    // Attach to map view changed event
    Microsoft.Maps.Events.addHandler(map, 'viewchangeend', function(e) {
            
        if (pushpin) {
            var loc = map.getCenter();
            // set pin location
            pushpin.setLocation(loc);
            // Set geolocation control value
            var eLatLng = jQuery("#[GEOLATLNGCONTROL]");
            if (eLatLng) {
                eLatLng.val(loc.latitude.toFixed(5) + "," + loc.longitude.toFixed(5));
            }
                
        }
            
    }); 
        
    var pushpinOptions = { draggable: true };
    var pushpin = new Microsoft.Maps.Pushpin(loc, pushpinOptions);

    Microsoft.Maps.Events.addHandler(pushpin, 'dragend', function (e) {

        var eLatLng = jQuery("#[GEOLATLNGCONTROL]");
        if (eLatLng) {
            // Get pin location
            var loc = e.entity.getLocation();
            // Set geolocation control value
            eLatLng.val(loc.latitude.toFixed(5) + "," + loc.longitude.toFixed(5));
            // Center map
            map.setView({center:loc});
        }

    });

    jQuery("#[CLEARCONTROL]").click(function() {
            
        var eLatLng = jQuery("#[GEOLATLNGCONTROL]");
        if (eLatLng) {
            eLatLng.val('');
        }

    });

    [/ISREADONLY]

    map.entities.push(pushpin);
    map.setView({ zoom: 8, center: loc })

});