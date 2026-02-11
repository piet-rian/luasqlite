# 軽量なプログラミング環境を求めて (lua+sqliteの場合)

ざっくり検討した結果、以下のどちらが良さそうと判断

- lua + sqlite <- 今回はこっち
- (Bun|Deno) + pglite
- (Bun|Deno) + sql.js

## 基本構成

OS, IDE, 言語, ソフトウェアほか諸々

- git
- vscode
- WSL (Debian)
- Docker (on WSL)
- devcontainer (Debian base)
- lua5.4
- luarocks
- sqlite3
