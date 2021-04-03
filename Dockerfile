FROM unityci/editor:ubuntu-2020.3.2f1-linux-il2cpp-0.11.0

RUN mkdir -p $HOME/.cache/unity3d
RUN mkdir -p $HOME/.local/share/unity3d/Unity
RUN apt-get update && apt-get -y install wget make
RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get -y install apt-transport-https dotnet-sdk-3.1 aspnetcore-runtime-3.1 dotnet-runtime-3.1
RUN dotnet tool install JetBrains.ReSharper.GlobalTools --tool-path /$HOME --version 2020.3.4-*
