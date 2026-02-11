#!/bin/sh

##### devcontainer の postCreateCommand から実行されるスクリプト
# ! devcontainer の features によらない `apt install` あるいはそれに準ずる行為はここで行うこと
# * 準ずる行為
#   * ソースからビルドする: `make install`
#   * 言語固有のパッケージマネージャーを使う: `npm install -g`, `pip install --user`, `luarocks install` など
#   * http(s)ネットワーク上からファイルを取得: `wget`, `curl` など

### スクリプト内でエラーが発生した場合に即座に終了するためのオプション
set -e

### 以下、tmp以下のディレクトリで実施する
mkdir /tmp/dev-container-post-create-user-define-actions
cd /tmp/dev-container-post-create-user-define-actions

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
# Cleanup
cd ..
rm -rf luarocks-${LUAROCKS_VERSION} luarocks-${LUAROCKS_VERSION}.tar.gz

# これを実行しないとluarocksでインストールしたモジュールがLuaから見えない
# ref. https://github.com/luarocks/luarocks/blob/main/docs/using_luarocks.md#rocks-trees-and-the-lua-libraries-path
eval "$(luarocks path --bin)"

##### Install Lua modules #####
# TODO モジュール増えてきた時の対応
### sql-orm
# ref. https://github.com/lalawue/lua-sql-orm
sudo luarocks install sql-orm

##### print completion message #####
echo -e "postCreateCommand.sh: \033[42m completed. \033[0m"
echo -e "\033[32m ===== devcontainer のセットアップが完了しました。 ===== \033[0m"
exit 0
