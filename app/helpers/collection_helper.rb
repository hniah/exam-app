module CollectionHelper
  def role_collection
    User.type.values.map { |role| [role, role] }
  end
end