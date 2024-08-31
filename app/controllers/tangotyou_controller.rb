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

  # 各項目変更
  def henkou
    p params
    word_params = params.permit(:yomi, :jisuu, :groove, :boin, :hinshi, :category)
    this_word = Word.find(params[:moto])
    this_word.update(word_params)
    redirect_to words_path
  end



  def show
    @word = Word.find(params[:id])

    @kanren_to_kanren = []

    @kishutsu = [@word.kaki]



    def kanrengo_st(word)
      kanren_tsuika = [word.kaki,[]]
      @kishutsu.push(word.kaki)
      kanren_tsuika
    end


    def kanrengo_list(word,group)
      kanrengo = word.kanren_zenbu()
      kanrengo.each_with_index do |kanren,i|
        if @kishutsu.include?(kanren.kaki) == false
          group.push(kanrengo_st(kanren))
        end
      end
    end

    kanrengo_list(@word,@kanren_to_kanren)

    @kanren_to_kanren.each do |kanren|
      kanrengo_list(Word.find_by(kaki:kanren[0]),kanren[1])
    end

    @kanren_to_kanren.each do |kanren|
      kanren[1].each do |kanren2|
        kanrengo_list(Word.find_by(kaki:kanren2[0]),kanren2[1])
      end
    end

    @kanren_to_kanren.each do |kanren|
      kanren[1].each do |kanren2|
        kanren2[1].each do |kanren3|
          kanrengo_list(Word.find_by(kaki:kanren3[0]),kanren3[1])
        end
      end
    end

    @kanren_to_kanren.each do |kanren|
      kanren[1].each do |kanren2|
        kanren2[1].each do |kanren3|
          kanren3[1].each do |kanren4|
            kanrengo_list(Word.find_by(kaki:kanren4[0]),kanren4[1])
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
