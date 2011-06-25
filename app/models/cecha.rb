class Cecha < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nazwa :string
    pytanie :text
    timestamps
  end

  has_many :cechas
  has_many :users, :through => :cechas

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

  def self.export
    result = ''
    Cecha.all.each do |cecha|
      result += "\nINSERT INTO `cecha` VALUES(#{cecha.id}, '#{cecha.nazwa}');'"
    end
    result
  end
end
