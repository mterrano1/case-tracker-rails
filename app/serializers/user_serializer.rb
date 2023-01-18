class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :role
  has_many :assigned_cases
end
