{include file='header.tpl'}


	<script src="/assets/public/js/jquery.min.js"></script>

<div id="allmap"></div>
{literal}
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(new BMap.Point(0,0), 3);  // 初始化地图,设置中心点坐标和地图级别
	map.enableAutoResize() ;
	map.setCurrentCity("香港");          // 设置地图显示的城市 此项是必须设置的
	map.disable3DBuilding();
	map.addEventListener("click",function(e){
		console.log(e.point.lng + "," + e.point.lat);
	});
	// map.disableDragging();
	var markers = [];
	
      
      $.getJSON( "/api/nodedraft", function( data ) {
	  var items = [];
	  $.each( data.data, function( key, val ) {
	    // items.push( "<li id='" + key + "'>" + val + "</li>" );
	    // console.log(val);
	    var ptMarker = new BMap.Marker(new BMap.Point(val.gps_land, val.gps_long));
      	ptMarker.setLabel(new BMap.Label(val.name,{offset:new BMap.Size(0,-20)}));
      	ptMarker.setTitle(val.status);
      	var ov = map.getOverlays();
      	var i;
      	for(i=0;i<ov.length;i++)
      	{
      		
      		if(ov[i].getPosition() != null){
      			if(ov[i].getPosition().equals(ptMarker.getPosition())){
	      			ov[i].getLabel().setOffset(new BMap.Size(0,ov[i].getLabel().getOffset().height-20));
	      		}
      		}
      		
      	}
      	
      	map.addOverlay(ptMarker);
	  });
});
      
</script>

<script type="text/javascript">



</script>

{/literal}

{include file='footer.tpl'}