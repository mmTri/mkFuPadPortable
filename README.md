# mkFuPadPortable
## これは何?
FuPadのisoイメージを作成するシェルスクリプト。

## 実行環境
次のパッケージをインストールした、Ubuntu Linuxを想定。
- msitools
- p7zip-full
- genisoimage

次のコマンドで、これらパッケージをまとめてインストール可能。
```shell
apt install msitools p7zip-full genisoimage
```
次のコマンドが存在すれば、他のUNIX系環境でも動作する(多分)。
- msiextract
    - msiファイルからのファイル抽出
- p7za
    - 7zipファイルの展開
- mkisofs
    - isoファイルの作成

## 必要なもの
### FuPadのインストーラ
moodleなどから入手する。
FuPad_for_ProgExII2023.msiのようなファイル名。

### MinGw64のバイナリファイルアーカイブ
次のURLから入手する。

https://github.com/niXman/mingw-builds-binaries/releases

2023年度版は、[x86_64-13.1.0-release-posix-seh-ucrt-rt_v11-rev1.7z](https://github.com/niXman/mingw-builds-binaries/releases/download/13.1.0-rt_v11-rev1/x86_64-13.1.0-release-posix-seh-ucrt-rt_v11-rev1.7z)を使用した。

## 実行方法

```shell
./mkFuPadPortable.sh <FuPadのインストーラ> <MinGw64のバイナリファイルアーカイブ>
```
そうすると、mkFuPadPortable.shと同じディレクトリに、FuPadPortable.isoが作成される。

### 実行例
2023年度版の場合は、次のように実行した。

```shell
./mkFuPadPortable.sh FuPad_for_ProgExII2023.msi x86_64-13.1.0-release-posix-seh-ucrt-rt_v11-rev1.7z
```

