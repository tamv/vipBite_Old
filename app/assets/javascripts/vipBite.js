
$(document).ready( function() {
	$("#becomeVIPbiteMemberButton").click( function (){
        window.location.href = "/account/Registration";
        return;
    })
});

function initialize()
    {
        var mapProp = {
            center:new google.maps.LatLng(51.0500,-114.0667),
            zoom:15,
            mapTypeId:google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
        
        google.maps.event.addDomListener(window, 'load', initialize);
    }