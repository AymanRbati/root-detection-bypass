FROM openjdk:8


ENV VERSION 26.0.1

WORKDIR /app

COPY entrypoint.sh .

RUN apt-get update -y && \
    apt-get install -y apt-utils wget curl unzip zipalign && \
    curl -sL https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -o /sdktools.zip && \
    mkdir /sdk && \
    unzip -q /sdktools.zip -d /sdk && \
    rm /sdktools.zip && \
    yes | /sdk/tools/bin/sdkmanager "build-tools;$VERSION" && \
    cp -a /sdk/build-tools/$VERSION/apksigner /sdk/build-tools/$VERSION/lib/apksigner.jar /usr/bin && \
    wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool && \
    chmod +x apktool && \
    mv apktool /usr/local/bin/apktool && \
    curl -s https://api.github.com/repos/iBotPeaches/Apktool/releases/latest \ 
    | grep "apktool_.*\.jar" | cut -d : -f 2,3 | tr -d '"' | sed -n 2p | wget -qi - && \
    mv apktool_*.jar /usr/local/bin/apktool.jar && \
    echo "elliot\nAllsafe\nEcorp\nNewYork\nNYC\nUS\nyes" | keytool -genkey -v -keystore /app/custom.keystore -alias mykeyaliasname -keyalg RSA -keysize 2048 -validity 10000 -storepass 448906 && \
    chmod +x entrypoint.sh

ENV PATH=/app/:$PATH

ENTRYPOINT ["entrypoint.sh"]