class RouteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_station_id, :destination_station_id, :distance, :time_duration, :departure_time
end
