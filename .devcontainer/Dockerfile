# Microsoft 提供の devcontainer イメージをベースにすることで、
# devcontainer.json の "remoteUser" プロパティを指定しなくても non-root ユーザで
# コンテナが動く
FROM mcr.microsoft.com/devcontainers/base:bookworm

# タイムゾーンを日本時間に設定(しないとDateコマンド等の時間がUTCになる)
ENV TZ=Asia/Tokyo
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

##### devcontainer 環境下における `apt install` について #####
# 0.  dockerfile内では基本的に行わないこと
#
# 1.  言語の実行環境整備などは、features による解決を優先すること
#       現に、本devcontainerでは sqlite3, lua のインストールを features で解決している
#       see. https://containers.dev/features/
#
# 2.  features で解決できない場合は `./devcontainer/postCreateCommand.sh` で行うこと
