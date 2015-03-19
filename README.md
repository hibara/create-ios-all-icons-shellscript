# create-ios-all-icons-shellscript

Use Shell Script commands in only MacOSX for generating all icons that need to build iOS app.

MacOSXに最初から入っているコマンドを使い、1024x1024（または512x512）サイズから、
シェルスクリプトを使って、iOSアプリに必要なすべてのサイズのアイコンファイルを生成します。

## with Android icons

せっかくなので、iOSアプリアイコンを生成するついでに、Androidアイコンも生成するシェルスクリプトを別途追加しました。

https://github.com/hibara/create-ios-all-icons-shellscript/blob/master/create_ios_and_android_icons.command

Added Shell Script that generates even Android icons with the iOS app icons.


# When that does not work...

スクリプトがうまく実行されない場合は、シェルスクリプトが実行されるディレクトリの権限を確認してください。
スクリプトは、自身のいるディレクトリ内に「出力」ディレクトリを新たに作成するので、
書き込み権限が必要です。また、自身のスクリプトとしての実行権限も必要になります。

When that does not work, check the permissions of the directory where the shell script is executed.
This Shell Script creates other output directory in the directory where is own script.
You will need to give write permission there. Also, you will need execute permission of as its own script.

たとえば、以下のようにコンソールから指定してください。    
For example, input command from the console as follows.

```sh
$ chmod a+x create_ios_icons.command
```

