class TangotyouController < ApplicationController

  # 一覧表示
  def index
    @words = Word.all
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

  # 削除
  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to words_path
  end
    
end
