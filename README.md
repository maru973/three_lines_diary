## Three Lines Diary
![lGqxlwLhhP5R7ff1711185785_1711185813](https://github.com/maru973/three_lines_diary/assets/148407473/6fcf878c-3f85-4fd1-b11e-726118906dc1)


## 概要

- ３行の英文日記を作成するアプリ

[Three Lines Diary](https://three-lines-diary-6kjc.onrender.com/)

## ターゲット層

- 英語学習中の人でライティングに力を入れたい人
- ライティングの学習はしたいけど、何から始めたらいいかわからない人

## このアプリを作ろうと思ったきっかけ

- 英語学習の方法で検索するとよく日記を書くといいと見聞きします。何度か日記を書くことに挑戦したのですが、なかなか継続できずにいました。英語が苦手な自分にとっては長文を書くほどの文が思いつかず、文章自体が続かないことも原因だと思いました。そこで3行という短い文にすれば、気軽にかけるのではないかと思いました。  
- 日記を書いて終わりでは英語力は一向に伸びないのですが、英語初学者にとってはどうやって正しい英語を調べたらいいかわからないため、自動で添削してくれる機能があればより効果的だと考えました。
    

## こだわりポイント

1. **コンセプト**
    
    日記 = 夜というイメージから黒を基調としたデザインにしました。
    
    筆記体にすることでおしゃれな感じと英語ができてる風を出すことでユーザーが継続できるような工夫をしました。
    
    Bootstrapを使ってユーザー情報は日記帳をイメージしたデザイン、日記の中身はノートをイメージして作成しました。
    
2. **英文添削機能**
    
    ターゲットが英語学習者に向けてのため、英文に自信がなかったり間違えたりということがあると思い、添削機能を実装しました。
    
    無料枠でできる英文添削のAPIを探していたのですが見つからず、実際にはDeepL翻訳APIを使い、日本語に一旦訳して、英語に再度訳し直すという方法を取りました。
    
    あくまでも自分の書いた英文と訂正文の違いを確認してほしいため、新規作成時のみ添削するようにしました。
    
3. **コメント以外は英語のみのバリデーション設定**
    
    英語学習のアプリのため、日本語は極力使わないようにしました。
    
    コメントはあえて日本語でも書けるようにすることで、他のユーザーが訂正などもしやすくしました。
    
4. **コメントのCRUDは非同期処理でできる**
    
    コメントは日記詳細ページの中に書くため非同期処理の方がUXが良いと思い、turboを使用しました。
    
5. **日記タイトルは自動で連番になるよう設定**
    
    日記を毎日つけていると何日継続できているのかといったことが気になり「Day1」「Day2」とつけ始めるのですが、いつも何日目だっだのかわからなくなるため、自動で表示できるようにしました。
    
6. **他ユーザーの日記一覧と自分の日記一覧**
    
    他のユーザーがどんな内容を書いているのか気になるのはもちろんのこと、自分が過去にどんなことを書いていたのか振り返るのが日記の醍醐味だと思います。そこで自分の日記のみを一覧で表示するページも作成して、振り返りができるようにしました。
    
