#!/bin/sh

##### devcontainer の postCreateCommand から実行されるスクリプト
# ! devcontainer の features によらない `apt install` あるいはそれに準ずる行為はここで行うこと
# * 準ずる行為
#   * ソースからビルドする: `make install`
#   * 言語固有のパッケージマネージャーを使う: `npm install -g`, `pip install --user`, `luarocks install` など
#   * http(s)ネットワーク上からファイルを取得: `wget`, `curl` など

### スクリプト内でエラーが発生した場合に即座に終了するためのオプション
set -e

##### Install LuaRocks #####
# ! devcontainer用イメージから apt で探しに行く先に luarocks が無いため、ソースからインストールする
# ref. https://github.com/luarocks/luarocks/blob/main/docs/installation_instructions_for_unix.md#quick-start
# check new version. https://luarocks.github.io/luarocks/releases/
LUAROCKS_VERSION=3.13.0
wget https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz
tar zxpf luarocks-${LUAROCKS_VERSION}.tar.gz
cd luarocks-${LUAROCKS_VERSION}
./configure --with-lua-include=/usr/local/include
make
sudo make install
sudo luarocks install luasocket
# Cleanup
cd ..
rm -rf luarocks-${LUAROCKS_VERSION} luarocks-${LUAROCKS_VERSION}.tar.gz

# これを実行しないとluarocksでインストールしたモジュールがLuaから見えない
# ref. https://github.com/luarocks/luarocks/blob/main/docs/using_luarocks.md#rocks-trees-and-the-lua-libraries-path
eval "$(luarocks path --bin)"

##### Install Lua modules #####
# TODO モジュール増えてきた時の対応
### lsqlite3
# ref. https://lua.sqlite.org/home/doc/tip/doc/lsqlite3.wiki
sudo luarocks install lsqlite3

##### print completion message #####
echo "postCreateCommand.sh: completed."
echo "おまたせしました！ devcontainer のセットアップが完了しました。"
exit 0
