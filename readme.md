# dotfiles

## インストール

```sh
git clone https://github.com/naoyafurudono/dotfiles.git
bash dotfiles/setup.sh
```

nvimの拡張機能の管理に `git submodule`　を使っています。
有効化するためには以下を実行します。

```sh
git submodule init
git submodule update
```

## TODO

- [ ] perform above in setup.sh
- [ ] gitのインストールを自動化
- [ ] テストの実施・自動テストの整備
  - [x] コンテナ環境で手動テストを実施 (ubuntu)
  - [ ] コンテナ環境で手動テストを実施 (mac os)
  - [ ] 自動テストを実施 (ubuntu)
  - [ ] 自動テストを実施 (mac os)

## 設定の追加

`.gitignore`をおしゃれに記述することで、ブラックリストではなくホワイトリストとして運用している。
リポジトリに追加したければ`.gitignore`を雰囲気で編集すること。

参考: <https://qiita.com/sventouz/items/574bd67c7e43fff10546>

## test

今はarmのubuntuだけ。

```sh
cd test
docker build . -t test && \
docker run --rm test
```

