class RouteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_station, :destination_station, :distance, :time_duration, :departure_time
end
