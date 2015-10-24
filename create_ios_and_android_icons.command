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

if [ -e "icon_1024x1024.png" ]; then
	if [ -e "icon_512x512.png" ]; then
		echo "icon_512x512.png はすでに存在しています。処理をスキップします。"
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
# アプリアイコン
#----------------------------------------------------------------------

# iPhone 6s Plus and iPhone 6 Plus (@3x) 
if [ -e "${outdir}/icon@3x _180x180.png" ]; then
	echo "icon@3x_180x180.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 180 ${BASE_FILE} --out ${outdir}/icon@3x_180x180.png
fi

# iPhone 6s, iPhone 6, and iPhone 5 (@2x)
# iPhone 4s (@2x)
if [ -e "${outdir}/icon@2x _120x120.png" ]; then
	echo "icon@2x _120x120.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 120 ${BASE_FILE} --out ${outdir}/icon@2x_120x120.png
fi

# iPad and iPad mini (@2x)
if [ -e "${outdir}/icon@2x_152x152.png" ]; then
	echo "icon@2x_152x152.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 152 ${BASE_FILE} --out ${outdir}/icon@2x_152x152.png
fi

# iPad 2 and iPad mini (@1x)
if [  -e "${outdir}/icon@1x_76x76.png"  ]; then
	echo "icon@1x_76x76.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 76 ${outdir}/icon@2x_152x152.png --out ${outdir}/icon@1x_76x76.png
fi

# iPad Pro (@2x)
if [ -e "${outdir}/icon@2x_167x167.png" ]; then
	echo "icon@2x_167x167.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 167 ${BASE_FILE} --out ${outdir}/icon@2x_167x167.png
fi

#----------------------------------------------------------------------
# Spotlight 検索結果アイコン
#----------------------------------------------------------------------
# iPhone 6s Plus and iPhone 6 Plus (@3x) 
if [ -e "${outdir}/spotlight_icon@3x_180x180.png" ]; then
	echo "spotlight_icon@3x_180x180.png はすでに存在しています。処理をスキップします。"
else
	cp -f ${outdir}/icon@3x_180x180.png ${outdir}/spotlight_icon@3x_180x180.png
fi

# iPhone 6s and iPhone 6 
# iPad and iPad mini (@2x) 
if [ -e "${outdir}/spotlight_icon@2x_120x120.png" ]; then
	echo "spotlight_icon@2x_120x120.png はすでに存在しています。処理をスキップします。"
else
	cp -f ${outdir}/icon@3x_120x120.png ${outdir}/spotlight_icon@2x_120x120.png
fi

# iPhone 5
#iPhone 4s (@2x) 
if [ -e "${outdir}/spotlight_icon@2x_80x80.png" ]; then
	echo "${outdir}/spotlight_icon@2x_80x80.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 80 ${BASE_FILE} --out ${outdir}/spotlight_icon@2x_80x80.png
fi

# iPad 2 and iPad mini (@1x) 
if [ -e "${outdir}/spotlight_icon@1x_60x60.png" ]; then
	echo "icon@1x_60x60.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 60 ${outdir}/icon@2x_120x120.png --out ${outdir}/spotlight_icon@2x_60x60.png
fi

# iPad Pro (@2x) 
if [ -e "${outdir}/spotlight_icon@2x_120x120.png" ]; then
	echo "spotlight_icon@2x_120x120.png はすでに存在しています。処理をスキップします。"
else
	cp -f ${outdir}/icon@3x_180x180.png ${outdir}/spotlight_icon@2x_120x120.png	
fi

#----------------------------------------------------------------------
# 設定アイコン
#----------------------------------------------------------------------

# iPhone 6s Plus and iPhone 6 Plus (@3x) 
# iPad 2 and iPad mini (@1x) 
if [ -e "${outdir}/setting_icon@3x_87x87.png" ]; then
	echo "setting_icon@3x_87x87.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 87 ${BASE_FILE} --out ${outdir}/setting_icon@3x_87x87.png
fi

# iPhone 6s, iPhone 6, and iPhone 5 (@2x)
if [ -e "${outdir}/setting_icon@2x_58x58.png" ]; then
	echo "setting_icon@2x_58x58.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 58 ${BASE_FILE} --out ${outdir}/setting_icon@2x_58x58.png
fi

# iPhone 4s (@2x)
if [ -e "${outdir}/setting_icon@2x_58x58.png" ]; then
	echo "setting_icon@2x_58x58.png はすでに存在しています。処理をスキップします。"
fi

# iPad and iPad mini (@2x)
if [ -e "${outdir}/setting_icon@2x_58x58.png" ]; then
	echo "setting_icon@2x_58x58.png はすでに存在しています。処理をスキップします。"
fi

# iPad 2 and iPad mini (@1x)
if [ -e "${outdir}/setting_icon@1x_29x29.png" ]; then
	echo "setting_icon@1x_29x29.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 29 ${outdir}/setting_icon@2x_58x58.png  --out ${outdir}/setting_icon@1x_29x29.png
fi

# iPad Pro (@2x)
if [ -e "${outdir}/setting_icon@2x_58x58.png" ]; then
	echo "setting_icon@2x_58x58.png はすでに存在しています。処理をスキップします。"
fi

#----------------------------------------------------------------------
# ウェブクリップアイコン
#----------------------------------------------------------------------

# iPhone 6s Plus and iPhone 6 Plus (@3x) 
if [ -e "${outdir}/webclip_icon@3x_180x180.png" ]; then
	cp -f ${outdir}/icon@3x_180x180.png ${outdir}/webclip_icon@3x_180x180.png
else
	sips -Z 180 ${BASE_FILE} --out ${outdir}/webclip_icon@3x_180x180.png
fi

# iPhone 6s, iPhone 6, and iPhone 5 (@2x)
# iPhone 4s (@2x)
if [ -e "${outdir}/webclip_icon@2x_120x120.png" ]; then
	cp -f ${outdir}/icon@2x_120x120.png ${outdir}/webclip_icon@2x_120x120.png
else
	sips -Z 120 ${BASE_FILE} --out ${outdir}/webclip_icon@2x_120x120.png
fi

# iPad and iPad mini (@2x)
if [ -e "${outdir}/webclip_icon@2x_152x152.png" ]; then
	cp -f ${outdir}/icon@2x_152x152.png ${outdir}/webclip_icon@2x_152x152.png
else
	sips -Z 152 ${BASE_FILE} --out ${outdir}/webclip_icon@2x_152x152.png
fi

# iPad 2 and iPad mini (@1x)
if [ -e "${outdir}/webclip_icon(@1x) _76x76.png" ]; then
	cp -f ${outdir}/icon@1x_76x76.png ${outdir}/webclip_icon@1x_76x76.png
else
	sips -Z 76 ${BASE_FILE} --out ${outdir}/webclip_icon@1x_76x76.png
fi

# iPad Pro (@2x)
if [ -e "${outdir}/webclip_icon@2x_167x167.png" ]; then
	cp -f ${outdir}/icon@2x_167x167.png ${outdir}/webclip_icon@2x_167x167.png 
else
	sips -Z 167 ${BASE_FILE} --out ${outdir}/webclip_icon@2x_167x167.png
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



