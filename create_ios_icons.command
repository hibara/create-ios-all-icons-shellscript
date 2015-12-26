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
