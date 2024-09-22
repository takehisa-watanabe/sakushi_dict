class TangotyouController < ApplicationController

  # 一覧表示
  def index
    @words = Word.latest
    @word = Word.new
    if request.post?
      word_params = params.permit(:yomi, :jisuu, :groove, :boin, :hinshi, :category)
      p word_params
      if not word_params[:yomi] == ""
        @words = @words.where(yomi:word_params[:yomi])
      end
      if not word_params[:jisuu] == ""
        @words = @words.where(jisuu:word_params[:jisuu])
      end
      if not word_params[:groove] == ""
        @words = @words.where(groove:word_params[:groove])
      end
      if not word_params[:boin] == ""
        @words = @words.where(boin:word_params[:boin])
      end
      if not word_params[:hinshi] == ""
        @words = @words.where(hinshi:word_params[:hinshi])
      end
      if not word_params[:category] == ""
        @words = @words.where(category:word_params[:category])
      end
    end
  end

  # 新規作成
  def shinki
    word_params = params.permit(:kaki, :yomi, :jisuu, :groove, :boin, :hinshi, :category)
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to words_url(@word), notice: "word was successfully created." }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # 関連語登録
  def kanrentouroku
    moto = Word.find(params[:moto])
    moto.kanren_touroku(params[:title])
    redirect_to words_path
  end

  def kanrentouroku_show
    moto = Word.find(params[:moto])
    moto.kanren_touroku(params[:title])
    redirect_to word_path(params[:moto])
  end

  # 各項目変更
  def henkou
    p params
    word_params = params.permit(:yomi, :jisuu, :groove, :boin, :hinshi, :category)
    this_word = Word.find(params[:moto])


    if word_params[:yomi] == ""
      word_params[:yomi] = this_word.yomi
    end
    if word_params[:jisuu] == ""
      word_params[:jisuu] = this_word.jisuu
    end
    if word_params[:groove] == ""
      word_params[:groove] = this_word.groove
    end
    if word_params[:boin] == ""
      word_params[:boin] = this_word.boin
    end
    if word_params[:hinshi] == ""
      word_params[:hinshi] = this_word.hinshi
    end
    if word_params[:category] == ""
      word_params[:category] = this_word.category
    end

    this_word.update(word_params)
    redirect_to words_path
  end


  # 個別表示
  def show
    @word = Word.find(params[:id])
    @id = params[:id]
    @kanren_to_kanren = []
    @kishutsu = [@word]

    @relate = params[:relate]

    @doushi = Word.where(hinshi: "動詞")
    @keiyoushi = Word.where(hinshi: "形容詞").or(Word.where(hinshi: "形容動詞"))
    @fukushi = Word.where(hinshi: "副詞")


    @kanrengo_1 = @word.kanren_zenbu()

    def kanrengo_st(word)
      kanren_tsuika = [word,[]]
      @kishutsu.push(word)
      kanren_tsuika
    end


    def kanrengo_list(word,group)
#      if word.category == "True"
#        return
#      end
      kanrengo = word.kanren_zenbu()
      kanrengo.each_with_index do |kanren,i|
        if @kishutsu.include?(kanren) == false
          group.push(kanrengo_st(kanren))
        end
      end
    end

    kanrengo_list(@word,@kanren_to_kanren)

    @kanren_to_kanren.each do |kanren|
      kanrengo_list(kanren[0],kanren[1])
    end

    @kanren_to_kanren.each do |kanren|
      kanren[1].each do |kanren2|
        kanrengo_list(kanren2[0],kanren2[1])
      end
    end

    @kanren_to_kanren.each do |kanren|
      kanren[1].each do |kanren2|
        kanren2[1].each do |kanren3|
          kanrengo_list(kanren3[0],kanren3[1])
        end
      end
    end

    @kanren_to_kanren.each do |kanren|
      kanren[1].each do |kanren2|
        kanren2[1].each do |kanren3|
          kanren3[1].each do |kanren4|
            kanrengo_list(kanren4[0],kanren4[1])
          end
        end
      end
    end

    p "========"
    p @kanren_to_kanren
    p @kishutsu

  end


  # 削除
  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to words_path
  end
    
end
