class StationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :city, :state
end
