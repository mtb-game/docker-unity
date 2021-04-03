FROM unityci/editor:ubuntu-2020.3.2f1-linux-il2cpp-0.11.0

RUN mkdir -p $HOME/.cache/unity3d
RUN mkdir -p $HOME/.local/share/unity3d/Unity

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install tzdata wget make

RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get -y install apt-transport-https gnupg ca-certificates dotnet-sdk-3.1 aspnetcore-runtime-3.1 dotnet-runtime-3.1
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update && apt-get -y install mono-complete
RUN export FrameworkPathOverride=/etc/mono/4.5

RUN dotnet tool install JetBrains.ReSharper.GlobalTools --tool-path /$HOME --version 2020.3.4-*
