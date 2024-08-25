class Word < ApplicationRecord
  has_many :active_kanrens, class_name: "Kanren", foreign_key: "moto_id", dependent: :destroy
  has_many :passive_kanrens, class_name: "Kanren", foreign_key: "saki_id", dependent: :destroy

  has_many :followings, through: :active_kanrens, source: :saki
  has_many :followers,  through: :passive_kanrens, source: :moto

  def kanren_touroku(saki)
    kanrensaki = Word.find_by(kaki:saki)
    if kanrensaki == nil
      kanrensaki = Word.new(kaki:saki)
      kanrensaki.save
    end
    active_kanrens.create(saki_id:kanrensaki.id)
    passive_kanrens.create(moto_id:kanrensaki.id)
  end

  def kanren_zenbu()
    p "=========="
    p followers.all
    followers.all
  end

end
