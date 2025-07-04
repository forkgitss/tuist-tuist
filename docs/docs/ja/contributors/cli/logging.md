---
title: ロギング
titleTemplate: :title · CLI · Contributors · Tuist
description: コードを確認してTuist に貢献する方法を学ぶ
---

# ロギング {#logging}

CLI はロギングのために [swift-log](https://github.com/apple/swift-log) インターフェースを採用しています。 パッケージはロギングの実装の詳細を抽象化し、CLIがロギングバックエンドに依存しないようにします。 The logger is dependency-injected using task locals and can be accessed anywhere using:

```bash
Logger.current
```

> [!NOTE]
> Task locals don't propagate the value when using `Dispatch` or detached tasks, so if you use them, you'll need to get it and pass it to the asynchronous operation.

## 記録する内容 {#what-to-log}

ログはCLIのUIではありません。 ログは発生した問題を診断するためのツールです。
したがって、あなたが提供する情報が多いほど、より良いです。
新しい機能を構築するときは、予期せぬ動作に遭遇する開発者の立場になって、 どんな情報が役に立つか考えください。
適切な[log level](https://www.swift.org/documentation/server/guides/libraries/log-levels.html)を使用することを徹底しましょう。 そうしないと、開発者は不要な情報をフィルターすることができなくなってしまいます。
