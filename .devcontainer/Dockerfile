# Note: You can use any Debian/Ubuntu based image you want.
FROM mcr.microsoft.com/devcontainers/base:bookworm

# タイムゾーンを日本時間に設定(しないとDateコマンド等の時間がUTCになる)
ENV TZ=Asia/Tokyo
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

### ! devcontainer の features で解消できない場合に限り、apt install を使うこと
# https://containers.dev/features/
# 実際の例として、本Devcontainer では Lua は features を用いて導入している。
# sqlite3 も features で導入できるが、libsqlite3-dev が入らないため、apt install を用いている。
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends sqlite3 libsqlite3-dev
