$(function(){
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(gon.hashs);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
});
