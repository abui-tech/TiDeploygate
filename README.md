TiDeploygate
============

Deploygate ios module for Titanium mobile

http://www.appcelerator.com/

## 使い方
1. deploygate ios sdkを手に入れる(https://deploygate.com/docs/ios_sdk)
2. TiDeploygateをチェックアウト
3. ルートディレクトリにある ti.deploygate-iphone-0.1.zip の中にある module.xcconfig のframework参照先を書き換える
  `OTHER_LDFLAGS=$(inherited) -framework DeployGateSDK -F"[ここをdeploygate ios sdkがある場所に書き換える]"`
4. ti.deploygate-iphone-0.1.zipをプロジェクトにインポートする
5. ユーザー認証を使う場合は プロジェクトの Info.plist に deploygateが指定するurl schemeを追加してください
