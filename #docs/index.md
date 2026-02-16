# 軽量なプログラミング環境を求めて (lua+sqliteの場合)

ざっくり検討した結果、以下のどれかが良さそうと判断

- **lua + sqlite** <- 今回はこれ
- (Bun|Deno) + pglite
- (Bun|Deno) + sql.js

## 基本構成

OS, IDE, 言語, ソフトウェアほか諸々

- git
- vscode
- WSL (Debian)
- Docker (on WSL)
- devcontainer (Debian base)

ここから下が検討ごとに異なる

- [lua](lua.md)
- [luarocks](luarocks.md)
- sqlite

## 検証結果

- luaそのものは軽量だが、周辺環境の整備コストが高い
  - パッケージマネージャー(luarocks) の導入が自前でのビルド
  - 5.5環境においてvscode上でデバッグするための簡単なルートがない等
- luaとデータベースの橋渡しをするライブラリに難あり
