class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :full_name, :email_address, :date_of_birth, :mobile_no, :profile_photo, :role
end
