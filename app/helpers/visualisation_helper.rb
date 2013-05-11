module VisualisationHelper
  def translate_coords_for_canvas(aircraft_to_draw, all_aircraft, width, height)
    min_latitude = aircraft_to_draw.latitude
    max_latitude = aircraft_to_draw.latitude

    min_longitude = aircraft_to_draw.longitude
    max_longitude = aircraft_to_draw.longitude

    all_aircraft.each do | aircraft |
      # work out what the min/max latitude are
      if aircraft.latitude < min_latitude
        min_latitude = aircraft.latitude
      end
  
      if aircraft.latitude > max_latitude
        max_latitude = aircraft.latitude
      end
  
      # work out what the min/max longitude are
        if aircraft.longitude < min_longitude
          min_longitude = aircraft.longitude
        end
    
        if aircraft.longitude > max_longitude
          max_longitude = aircraft.longitude
        end
    end

      # scale the latitudes with the canvas width
      x = (aircraft_to_draw.latitude / (max_latitude - min_latitude)) * width
      # scale the longitudes with the canvas height
      y = (aircraft_to_draw.longitude / (max_longitude - min_longitude)) * height
  
      return [x, y]
  end
end
