# Note: You can use any Debian/Ubuntu based image you want.
FROM mcr.microsoft.com/devcontainers/base:bookworm

# タイムゾーンを日本時間に設定(しないとDateコマンド等の時間がUTCになる)
ENV TZ=Asia/Tokyo
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

### ! devcontainer の features で解消できない場合に限り、apt install を使うこと
# see. https://containers.dev/features/
# RUN apt-get update \
#   && export DEBIAN_FRONTEND=noninteractive \
#   && apt-get -y install --no-install-recommends \
#     <package-name>
