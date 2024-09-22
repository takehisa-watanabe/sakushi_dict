class ToppageController < ApplicationController
  def home
    @aaa = "hello world!"

    @things = [["楽器",[["ギター",["ギブソン","フェンダー"]],["ピアノ",["ヤマハ","スタインウェイ"]]]],["果物",[["いちご",["とちおとめ","べにほっぺ"]],["ぶどう",["巨峰","シャインマスカット"]]]]]
  end
end
