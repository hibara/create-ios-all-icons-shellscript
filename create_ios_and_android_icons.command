#!/bin/sh
#このシェルスクリプトを実行した場所をカレントディレクトリにする（お約束）
cd `dirname $0`

# 出力ディレクトリの生成
outdir="ios"
mkdir -p $outdir

#----------------------------------------------------------------------
# iTunes Artwork アイコン
#----------------------------------------------------------------------

# iPhone6, iPhone6 Plus登場以降、全デバイスで1024x1024が必須となりました。↓
# https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/IconMatrix.html
# ですので、このスクリプトでは最低でも、512x512サイズのアイコン画像がないと処理を終了するように修正しました。

# App icon for the App Store (すべてのアプリで必須)
if [ -e "icon_1024x1024.png" ]; then
	if [ -e "icon_512x512.png" ]; then
		echo "icon_512x512.png はすでに存在しています。処理をスキップします。"
		BASE_FILE="icon_1024x1024.png"
	else
		sips -Z 512 icon_1024x1024.png --out icon_512x512.png
		BASE_FILE="icon_1024x1024.png"
	fi
fi

if [ -e "icon_512x512.png" ]; then
	if [ -e "icon_1024x1024.png" ]; then
		echo "icon_1024x1024.png はすでに存在しています。処理をスキップします。"
	else
		sips -Z 1024 icon_1024x1024.png --out icon_512x512.png
		BASE_FILE="icon_512x512.png"
	fi
else
	echo "iTunes Artworkに設定できる適当なサイズが見つかりません。\niPhone6, iPhone6 Plus登場以降から、1024x1024が必須となりました。"
	exit
fi

#----------------------------------------------------------------------
# アプリアイコン（ファイル名）
#----------------------------------------------------------------------

echo "BASE_ICON: "
echo ${BASE_FILE}

# iPhone Spotlight - iOS 5,6　推奨
#        Settings - iOS 5-9　推奨
if [ -e "${outdir}/icon-small.png" ]; then
	echo "icon-small.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 29 ${BASE_FILE} --out ${outdir}/icon-small.png
fi

# iPhone 6s,iPhone 6, and iPhone 5(@2x)　推奨
# iPhone 4s(@2x)　推奨
if [ -e "${outdir}/icon-small@2x.png" ]; then
	echo "icon-small@2x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 58 ${BASE_FILE} --out ${outdir}/icon-small@2x.png
fi

# iPhone 6s Plus and iPhone 6 Plus (@3x)　推奨
if [ -e "${outdir}/icon-small@3x.png" ]; then
	echo "icon-small@3x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 87 ${BASE_FILE} --out ${outdir}/icon-small@3x.png
fi

#----------------------------------------------------------------------
# iPhone Spotlight iOS 7-9

# iPhone 5(@2x)　推奨
# iPhone 4s(@2x)　推奨
if [ -e "${outdir}/icon-40@2x.png" ]; then
	echo "icon-40@2x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 80 ${BASE_FILE} --out ${outdir}/icon-40@2x.png
fi

# iPhone 6s, iPhone 6(@2x)　推奨
if [ -e "${outdir}/icon-40@3x.png" ]; then
	echo "icon-40@3x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 120 ${BASE_FILE} --out ${outdir}/icon-40@3x.png
fi

# iPhone App iOS 5,6
if [ -e "${outdir}/icon.png" ]; then
	echo "icon.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 57 ${BASE_FILE} --out ${outdir}/icon.png
fi

if [ -e "${outdir}/icon@2x.png" ]; then
	echo "icon@2x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 114 ${BASE_FILE} --out ${outdir}/icon@2x.png
fi

#----------------------------------------------------------------------
#iPhone App iOS 7-9

# iPhone 6s,iPhone 6, and iPhone 5(@2x)　必須
# iPhone 4s(@2x)　必須
if [ -e "${outdir}/icon-60@2x.png" ]; then
	echo "icon-60@2x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 120 ${BASE_FILE} --out ${outdir}/icon-60@2x.png
fi

# iPhone 6s Plus and iPhone 6 Plus (@3x)　必須
# iPhone 6s Plus and iPhone 6 Plus (@3x) Spotlight search results icon　推奨
if [ -e "${outdir}/icon-60@3x.png" ]; then
	echo "icon-60@3x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 180 ${BASE_FILE} --out ${outdir}/icon-60@3x.png
fi

#----------------------------------------------------------------------
# iPad Settings iOS 5-9

# iPad 2 and iPad mini(@1x)　推奨
if [ -e "${outdir}/icon-small.png" ]; then
	echo "icon-small.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 29 ${BASE_FILE} --out ${outdir}/icon-small.png
fi

# iPad and iPad mini(@2x)　推奨
# iPad Pro(@2x)　推奨
if [ -e "${outdir}/icon-small@2x.png" ]; then
	echo "icon-small@2x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 58 ${BASE_FILE} --out ${outdir}/icon-small@2x.png
fi

#----------------------------------------------------------------------
# iPad Spotlight iOS 7-9

# iPad 2 and iPad mini(@1x)　推奨　※ただしドキュメントでは120x120サイズとなっている。
if [ -e "${outdir}/icon-40.png" ]; then
	echo "icon-40.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 40 ${BASE_FILE} --out ${outdir}/icon-40.png
fi

# iPad and iPad mini(@2x)　推奨　※ただしドキュメントでは180x180サイズとなっている。
# iPad Pro(@2x)　推奨　※ただしドキュメントでは180x180サイズとなっている。
if [ -e "${outdir}/icon-40@2x.png" ]; then
	echo "icon-40@2x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 80 ${BASE_FILE} --out ${outdir}/icon-40@2x.png
fi

#----------------------------------------------------------------------
# iPad Spotlight iOS 5,6

if [ -e "${outdir}/icon-50.png" ]; then
	echo "icon-50.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 50 ${BASE_FILE} --out ${outdir}/icon-50.png
fi

if [ -e "${outdir}/icon-50@2x.png" ]; then
	echo "icon-50@2x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 100 ${BASE_FILE} --out ${outdir}/icon-50@2x.png
fi

#----------------------------------------------------------------------
# iPad App iOS 5,6

if [ -e "${outdir}/icon-72.png" ]; then
	echo "icon-72.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 72 ${BASE_FILE} --out ${outdir}/icon-72.png
fi

if [ -e "${outdir}/icon-72@2x.png" ]; then
	echo "icon-72@2x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 144 ${BASE_FILE} --out ${outdir}/icon-72@2x.png
fi

#----------------------------------------------------------------------
# iPad App iOS 7-9

# iPad 2 and iPad mini(@1x)　必須
if [ -e "${outdir}/icon-76.png" ]; then
	echo "icon-76.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 76 ${BASE_FILE} --out ${outdir}/icon-76.png
fi

# iPad and iPad mini(@2x)　必須
if [ -e "${outdir}/icon-76@2x.png" ]; then
	echo "icon-76@2x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 152 ${BASE_FILE} --out ${outdir}/icon-76@2x.png
fi

#----------------------------------------------------------------------
# iPad Pro App iOS 9

# iPad Pro(@2x)　必須
if [ -e "${outdir}/icon-83.5@2x.png" ]; then
	echo "icon-83.5@2x.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 167 ${BASE_FILE} --out ${outdir}/icon-83.5@2x.png
fi

#======================================================================
# Android
#======================================================================

# 出力ディレクトリの生成
outdir="Android"
mkdir -p $outdir

# xxxhdpi(〜640dpi)
if [ -e "${outdir}/icon_192x192.png" ]; then
    echo "icon_192x192.png はすでに存在しています。\n"
else
    sips -Z 192 ${BASE_FILE} --out ${outdir}/icon_192x192.png
fi

# xxhdpi(〜480dpi)
if [ -e "${outdir}/icon_144x144.png" ]; then
    echo "icon_144x144.png はすでに存在しています。\n"
else
    sips -Z 144 ${BASE_FILE} --out ${outdir}/icon_144x144.png
fi

# xhdpi(〜320dpi)
if [ -e "${outdir}/icon_96x96.png" ]; then
    echo "icon_96x96.png はすでに存在しています。\n"
else
    sips -Z 96 ${outdir}/icon_192x192.png --out ${outdir}/icon_96x96.png
fi

# hdpi(〜240dpi)
if [ -e "${outdir}/icon_72x72.png" ]; then
    echo "icon_72x72.png はすでに存在しています。\n"
else
    sips -Z 72 ${outdir}/icon_144x144.png --out ${outdir}/icon_72x72.png
fi

# mdpi(〜160dpi)
if [ -e "${outdir}/icon_48x48.png" ]; then
    echo "icon_48x48.png はすでに存在しています。\n"
else
    sips -Z 48 ${outdir}/icon_144x144.png --out ${outdir}/icon_48x48.png
fi

# ldpi(〜120dpi)
if [ -e "${outdir}/icon_36x36.png" ]; then
    echo "icon_36x36.png はすでに存在しています。\n"
else
    sips -Z 36 ${outdir}/icon_72x72.png --out ${outdir}/icon_36x36.png
fi

#-----------------------------------
# 生成した各サイズのアイコンを一括リネーム
#-----------------------------------

androiddir="${outdir}/drawable-xxxhdpi"
mkdir -m a+w -pv $androiddir
cp -fv "${outdir}/icon_192x192.png" "${androiddir}/icon.png"

androiddir="${outdir}/drawable-xxhdpi"
mkdir -m a+w -pv $androiddir
cp -fv "${outdir}/icon_144x144.png" "${androiddir}/icon.png"

androiddir="${outdir}/drawable-xhdpi"
mkdir -m a+w -pv $androiddir
cp -fv "${outdir}/icon_96x96.png" "${androiddir}/icon.png"

androiddir="${outdir}/drawable-hdpi"
mkdir -m a+w -pv $androiddir
cp -fv "${outdir}/icon_72x72.png" "${androiddir}/icon.png"

androiddir="${outdir}/drawable-mdpi"
mkdir -m a+w -pv $androiddir
cp -fv "${outdir}/icon_48x48.png" "${androiddir}/icon.png"

androiddir="${outdir}/drawable-ldpi"
mkdir -m a+w -pv $androiddir
cp -fv "${outdir}/icon_36x36.png" "${androiddir}/icon.png"
