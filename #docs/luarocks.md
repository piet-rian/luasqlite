# luarocks

luaモジュール向けのパッケージマネージャー。
node.jsにおけるnpmに相当するそれ。

## インストール

devcontainer周辺機能を用いて自動的に導入される。

- 公式サイトからソースコード引っ張ってきて自前でビルドする方式
  - devcontainerのベースイメージが参照するリポジトリにluarocksが無い

詳細は `.devcontainer/postCreateCommand.sh` 参照

## モジュールの追加

```sh
# usage
sudo luarocks install <module_name>
# example
sudo luarocks install lsqlite3
```

## 他コマンド

ないものは `luarocks --help` で各自調査

```sh
# 追加済みモジュールのリストアップ
luarocks list
# 追加済みモジュールの詳細表示(対応バージョンとかがわかる)
luarocks show <module_name>
# rocks上に存在するモジュールの検索
luarocks search <keyword>
# 追加積みモジュールの除去
sudo luarocks remove <module_name>
```

## TODO

- 5.5環境で使えるsqlite用のモジュール
  - lsqlite3が5.5未対応 & sqlite特化
    - もうちょっと汎用的なライブラリがあればそっちにしたい
  - 候補ピックアップ
    - LuaSQL ... 複数DB対応は良いが方式があまりに原始的すぎるのでなし
    - luadbi ... luasqlと同程度の原始的さ
    - `kkharji/sqlite.lua` ... こいつが要求する luv の install時 にcmakeがないエラーが出るのでなし
    - `sql-orm` ... 感覚的には一番モダン

## ref

- https://luarocks.org/
