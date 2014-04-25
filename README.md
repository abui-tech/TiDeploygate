TiDeploygate
============

Deploygate ios module for Titanium mobile

http://www.appcelerator.com/

https://deploygate.com/

## 主な機能
1. リモートログ出力
2. deploygateユーザー認証
3. アップデート通知

## 使い方
1. deploygate ios sdkを手に入れる https://deploygate.com/docs/ios_sdk
1. TiDeploygateをチェックアウトし、ルートディレクトリにある ti.deploygate-iphone-0.1.zip の中にある module.xcconfig のframework参照先を書き換える
  `OTHER_LDFLAGS=$(inherited) -framework DeployGateSDK -F"[ここをdeploygate ios sdkがある場所に書き換える]"`
1. ti.deploygate-iphone-0.1.zipをプロジェクトにインポートする
1. ユーザー認証を使う場合は プロジェクトの Info.plist に deploygateが指定するurl schemeを追加してください

## サンプルコード
+ <a href="source/example/app.js">source/example/app.js</a>

=====
The MIT License (MIT)
