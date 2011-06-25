class Rasa < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nazwa :string
    opis  :string
    timestamps
  end

  has_many :stopiens
  has_many :users, :through => :stopiens

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

  def stopien_opisania(user)
    Stopien.rasa_is(self).user_is(user).count.to_f / Cecha.count
  end

  def opisane(user)
    return if user.guest?
    stopiens.user_is(user)
  end

  def nie_opisane(user)
    return if user.guest?
    Cecha.all :conditions => "NOT EXISTS (SELECT * FROM stopiens WHERE cecha_id = cechas.id AND user_id = #{user.id})"
  end

  def self.export
    result = ''
    Rasa.all.each do |rasa|
      result += "\nINSERT INTO `rasa` VALUES(#{rasa.id}, '#{rasa.nazwa}', '#{rasa.opis}');"
    end
    result
  end
end
