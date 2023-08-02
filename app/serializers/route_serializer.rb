class RouteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :distance, :time_duration, :departure_time
end
