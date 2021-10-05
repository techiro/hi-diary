# Git関連

gitignoreに追加されているファイルを確認
`git ls-files --other --ignored --exclude-standard`

マークダウンを表示
https://qiita.com/Arime/items/4a1f90b3b5cea4b63327


BFGでGitHub上のコミット履歴からパスワードを削除する
https://qiita.com/jnchito/items/64ffb76a9c645323f43c

```
brew update
brew install bfg
bfg --version
```
##bfgの使い方
まずはgit履歴のコピーを取得 特定のフォルダworkなどに作成するのが好ましい．
```
git clone --mirror https://github.com/techiro/hi-diary.git
```
*hi-diary.git*が取得できたら，不要なファイルを削除する．

###不要なファイルを削除する方法
コマンドの実行時のフォルダは以下のような関係

```
work/<-current dir
├── hi-diary.git/
└── passwords.txt

```
*$work/*上でコマンドを叩く．
```
bfg --delete-files GoogleService-Info.plist hi-diary.git
```
