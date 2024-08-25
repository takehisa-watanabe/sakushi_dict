class TestController < ApplicationController
  def test
    @words = Word.all
    @word = Word.find_by(kaki:"死")

    @things = [["楽器",[["ギター",["ギブソン","フェンダー"]],["ピアノ",["ヤマハ","スタインウェイ"]]]],["果物",[["いちご",["とちおとめ","べにほっぺ"]],["ぶどう",["巨峰","シャインマスカット"]]]]]

    #Kanren.create(moto_id:4,saki_id:5)
    p Word.all
    ringo = Word.find(4)
    banana = Word.find(5)
    p "=========="
    p ringo
    p banana

    #banana.kanren_touroku(ringo)








  end
end
