# lua

- 実行環境が軽量 (採用理由の筆頭)
- 一般的には後付のユーザースクリプト用途だが、これそのもので開発しようというものが今回のメイン

## インストール

- devcontainerのfeatures機能によって自動で行われる
  - 公式サイトのアーカイブファイルを展開する方式
    - devcontainerのベースイメージが参照するリポジトリにluaが無い

## バージョン

5.4系

- 2025-12-22に5.5が登場している
- 2026-02-11時点において luarocks上のモジュール側が5.5対応してない
  - luaはマイナーバージョンのリリースですら数年単位
  - lua5.4のリリースが2020年

### バージョンを変える場合

1. features内の指定を変える。
2. `.vscode/settings.json` の `lua-local.interpreter` の指定を 1. と合わせる

## 実行方法

```sh
# usage
lua [options] [script [args]]
# example
lua gcp.lua 100
```

## デバッグ方法

デバッグ用のvscode拡張 `tomblind.local-lua-debugger-vscode` が自動で導入されるため、それに頼る。

1. ソース内にブレークポイントを設定
2. エントリーポイントとなるファイルを開いて `F5`
3. ブレークポイントで止まる
4. 以降はvscodeを用いた一般的なデバッグに準ずる

**TODO: アタッチ(デバッガだけ先に立ち上げてluaそのものはターミナルから実行する)方式を調べる**

## コンパイル

```sh
# usage
luac [options] [filenames]
# example
luac gcp.lua
# -o 指定していないため、成果物は `元のファイル名.o` として出力される
```

### コンパイル成果物から実行

```sh
# example
lua gcp.o
```

### luaにおけるコンパイル・ビルド

- ユーザー側による不慮のソースコード変更からの保護の役目が強い
- コンパイル・ビルトを通じて高速化したい場合は[luajit](https://luajit.org/index.html)を用いる

## luarocks

- luaのパッケージマネージャ
  - node.jsにおけるnpmに相当するそれ
- 詳細は別記事

## ref

- https://www.lua.org/
- https://luajit.org/
- https://luarocks.org/

日本語圏情報

- https://ja.wikibooks.org/wiki/Lua
- https://qiita.com/advent-calendar/2025/lua
- [Lua 5.4リファレンスマニュアル（日本語訳）](https://inzkyk.xyz/lua_5_4/) ※非公式
