class Stopien < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    dopasowanie :float
    timestamps
  end

  belongs_to :user, :creator => true
  belongs_to :cecha
  belongs_to :rasa

  validate :dopasowanie_z_0_1
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

  def self.export
    result = ''
    Rasa.all.each do |rasa|
      sid = rasa.id
      Cecha.all.each do |cecha|
        cid = cecha.id
        val = Stopien.rasa_is(sid).cecha_is(cid).average(:dopasowanie) || 0
        result += "\nINSERT INTO `cecha_rasa` VALUES(#{cid}, #{sid}, #{val});"
      end
    end
    result
  end

  protected
    def dopasowanie_z_0_1
      if dopasowanie < 0 or dopasowanie > 1
        errors.add(:dopasowanie, 'Dopasowanie powinno byc z przedzialu [0,1]')
      end
    end
end
