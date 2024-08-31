class Word < ApplicationRecord
  has_many :active_kanrens, class_name: "Kanren", foreign_key: "moto_id", dependent: :destroy
  has_many :passive_kanrens, class_name: "Kanren", foreign_key: "saki_id", dependent: :destroy

  has_many :followings, through: :active_kanrens, source: :saki
  has_many :followers,  through: :passive_kanrens, source: :moto

  scope :latest, -> {order(updated_at: :desc)}

  def kanren_touroku(saki)
    kanrensaki = Word.find_by(kaki:saki)
    if kanrensaki == nil
      kanrensaki = Word.new(kaki:saki)
      kanrensaki.save
    end

    if active_kanrens.find_by(saki_id:kanrensaki.id) == nil
      active_kanrens.create(saki_id:kanrensaki.id)
      passive_kanrens.create(moto_id:kanrensaki.id)
    else
      active_kanrens.find_by(saki_id:kanrensaki.id).destroy
      passive_kanrens.find_by(moto_id:kanrensaki.id).destroy
    end

  end

  def kanren_zenbu()
    followers.all
  end

end
