class ServiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :icon
end
