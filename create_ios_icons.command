#!/bin/sh
#このシェルスクリプトを実行した場所をカレントディレクトリにする（お約束）
cd `dirname $0`

# 出力ディレクトリの生成
outdir="ios_name"
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


