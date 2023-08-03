class BusSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :bus_number, :capacity
end
