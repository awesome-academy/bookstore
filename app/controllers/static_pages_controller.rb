class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
    @places = Place.select_places
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow render_to_string partial: "static_pages/infowindow", locals: { place: place }
    end
    gon.hashs = @hash
  end
end
