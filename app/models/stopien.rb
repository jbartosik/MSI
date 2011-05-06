class Stopien < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    dopasowanie :float
    timestamps
  end

  belongs_to :user, :creator => true
  belongs_to :cecha
  belongs_to :swiat

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    return false unless user_is?(acting_user)
    return true if new_record?
    return false if user_changed?
    only_changed? :dopasowanie
  end

  def destroy_permitted?
    return false unless user_is?(acting_user)
    return false if user_changed?
    true
  end

  def view_permitted?(field)
    true
  end

end
