
$(document).ready( function() {
	$("#becomeVIPbiteMemberButton").click( function (){
        window.location.href = "/account/Registration";
        return;
    })

    $('.twitterpopup').click(function(event) {
    var width  = 575,
        height = 400,
        left   = ($(window).width()  - width)  / 2,
        top    = ($(window).height() - height) / 2,
        url    = this.href,
        opts   = 'status=1' +
                 ',width='  + width  +
                 ',height=' + height +
                 ',top='    + top    +
                 ',left='   + left;
    
    window.open(url, 'twitter', opts);
 
    return false;
  });
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