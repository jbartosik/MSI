class Swiat < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nazwa :string
    opis  :string
    timestamps
  end

  has_many :dopasowanies
  has_many :users, :through => :dopasowanies

  self.name_attribute = :nazwa

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
