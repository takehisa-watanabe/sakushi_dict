$ gem install -v 7.2.1 rails<br>
$ git clone https://github.com/takehisa-watanabe/sakushi_dict.git<br>
$ cd sakushi_dict<br>
$ rails s<br>
<br>
<br>個人的な音楽活動のために開発した作詞用の単語帳です。
<br>
<br>
<br>【全件表示ページ】
<br>
<br>データベースに登録された単語を全て表示します。
<br>
<br>・書き
<br>　→その単語の書き
<br>・読み
<br>　→その単語の読みをカタカナ表記で
<br>・字数
<br>　→その単語の字数
<br>・グルーヴ
<br>　→その単語を構成するある文字の次の文字が①母音②"ン"③"ッ"のいずれかであった場合、
<br>　　その2文字を１つの音符の上に乗せることのできるひと固まりとして扱い、
<br>　　この固まりを"2"と表記、固まりを形成しない文字は"1"と表記する。
<br>　　例えば"天の川"と"銀河系"は同じ5文字だが、前者は"11111"、後者は"212"と表記される。
<br>・品詞
<br>　→その単語の品詞
<br>・カテゴリ
<br>　→その単語が極めて多くの単語を包括するカテゴリであるか否か。
<br>　　"果物"、"動物"などがそれにあたる。
<br>・関連語
<br>　→その単語と関わりの深い別の単語。
<br>　　フォームに関連語の書きを入力し追加ボタンを押すと、
<br>　　既にその単語がデータベースにある場合お互いが相互に関連語として登録され、
<br>　　まだデータベースにない単語を入力された場合はその単語のレコードを
<br>　　新規登録した上で相互に関連語登録を行う。
<br>
<br>
<br>【詳細ページ】
<br>
<br>単語のレコード１件について、
<br>
<br>①その単語の関連語
<br>②関連語の関連語
<br>③関連語の関連語の関連語
<br>
<br>をテーブル上に表示します。
<br>
<br>テーブルの上に位置するセレクトボックスから"4"を選び送信ボタンを押すと、
<br>追加で「関連語の関連語の関連語の関連語」までテーブルに表示されます。
<br>
<br>
<br>【使用例①】
<br>
<br>19世紀フランスの詩人ロートレアモン伯爵の有名な詩の一節として
<br>「解剖台の上のミシンと蝙蝠傘の偶然の出会いのように美しい」というものがあります。
<br>例として「ミシン」の詳細ページに表示された関連語テーブルをご覧ください。
<br>![スクリーンショット 2024-09-22 210711](https://github.com/user-attachments/assets/2323ddeb-ef3b-4b5d-993c-5c34367a58ec)
<br>
<br>ミシンの用途は縫うことである→縫合は手術の工程のひとつである→手術は手術台(解剖台)の上で行われる
<br>といったように、論理的な繋がりを持った突飛な単語の組み合わせを思い付きやひらめきに頼らず
<br>無数に出力できるのがこのアプリの最大の強みです。
<br>
<br>
<br>【使用例②】
<br>
<br>aikoの代表曲「花火」のサビ部分に
<br>「夏の星座にぶら下がって」という一節があります。
<br>「夏の星座」も「ぶら下がる」もそれぞれ何の変哲もない単語ですが、
<br>星座をぶら下がる対象として見做すのはなかなか出てくる発想ではありません。
<br>以下の画像は「星座」の詳細ページです。
<br>![スクリーンショット 2024-09-22 210835](https://github.com/user-attachments/assets/e5594ec3-c0c4-4ad4-af97-6609e5c03b1f)
<br>
<br>このように、ある名詞の状態を表す形容詞→その形容詞が表す状態にある物に対して行うことができる行動の動詞
<br>という順を辿ることによって、「夏の星座にぶら下がる」ような構造の文章を手軽に出力することができます。

