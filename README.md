# 株式会社ゆめみ Flutter エンジニアコードチェック課題

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

本プロジェクトは株式会社ゆめみ（以下弊社）が、弊社に Flutter エンジニアを希望する方に出す課題用のプロジェクトです。 本課題が与えられた方は、以下を詳しく読んだ上で課題に取り組んでください。

## 概要

以下の要件を満たす、Android・iOS で動作するアプリを Flutter で作成してください。

## 要件

### 環境

- IDE・SDK・プログラミング言語については、基本的に最新の安定版を利用すること
- 最新の安定版以外を利用する場合は、理由も含めて README に記載すること
- 状態管理パッケージには Provider/Riverpod のいずれかを使うこと
- サードパーティーライブラリについては、オープンソースのものに限り制限しない

### 対象 OS バージョン

基本的に Flutter プロジェクト作成時のバージョンにすること

|         | OS Version |
| ------- | ---------- |
| iOS     | 9.0 ~ 15.2 |
| Android | 4.1 ~ 12   |

※ 本プロジェクト更新時点

### 動作

- 何かしらのキーワードを入力できる
- 入力したキーワードで GitHub のリポジトリを検索できる
- GitHub のリポジトリを検索する際、GitHub API（[`search/repositories`](https://docs.github.com/ja/rest/reference/search#search-repositories)）を利用する
  - [github | Dart Package](https://pub.dev/packages/github) のようなパッケージは利用せず、API を呼ぶ処理を自分で実装すること
- 検索結果は一覧で概要（リポジトリ名）を表示する
- 検索結果のアイテムをタップしたら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示する

### デザイン

マテリアルデザインに準拠すること

## 提出方法

- GitHub の public リポジトリの URL をお知らせください
- 別の方法で提出する場合はご相談ください（Git のコミット履歴が分かる形式が望ましいです）
- この課題とは別のコード(ご自身で公開されている OSS 等)をもって課題の提出とすることをご希望の場合はご相談ください

## パッケージ

- [app_settings: ^5.1.1](https://pub.dev/packages/app_settings)
- [cached_network_image: ^3.4.1](https://pub.dev/packages/cached_network_image)
- [dio: ^5.5.0+1](https://pub.dev/packages/dio)
- [easy_localization: ^3.0.7](https://pub.dev/packages/easy_localization)
- [flutter_riverpod: ^2.5.1](https://pub.dev/packages/flutter_riverpod)
- [flutter_svg ^2.0.10+1](https://pub.dev/packages/flutter_svg)
- [freezed: ^2.5.7](https://pub.dev/packages/freezed)
- [freezed_annotation: ^2.4.4](https://pub.dev/packages/freezed_annotation)
- [intl ^0.19.0](https://pub.dev/packages/intl)
- [json_annotation: ^4.9.0](https://pub.dev/packages/json_annotation)
- [mocktail: ^1.0.4](https://pub.dev/packages/mocktail)
- [riverpod_annotation: ^2.3.5](https://pub.dev/packages/riverpod_annotation)
- [shared_preferences: ^2.3.2](https://pub.dev/packages/shared_preferences)
- [very_good_analysis: ^6.0.0](https://pub.dev/packages/very_good_analysis)

## コード生成

Freezed や Riverpod などのパッケージを使ってコード生成を行なっています。

`dart run build_runner build -d`

## 多言語化

[easy_localization](https://pub.dev/packages/easy_localization) を使用しています。

`assets/translations/`内の各言語 json ファイルを編集後は下記を実行してください。

`dart run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart`

## App Settings (注意)

このアプリは App_Settings パッケージを使用しているため、ユーザーが言語を変更する際は、アプリの設定画面に移ります。ios のローカル環境で言語変更を行った場合、デバイスとの接続が切れてしまいます。

android のローカル環境で言語変更を行った場合は、デバイスとの接続を一旦切っていただく必要があります。

## Lint Rules

[Very Good Ventures](https://verygood.ventures/)の very_good_analysis を使用して Lint Rule を設定しています。

## Credits

- [DevIcon](https://github.com/devicons/devicon/): App Bar で使用している GitHub のアイコン

## 評価ポイント

- レビューのしやすさ
  - README の充実
  - 適切なコメント
  - GitHub のプルリクエスト機能などの利用
- Git
  - 適切な gitignore の設定
  - 適切なコミット粒度
  - 適切なブランチ運用
- 簡潔性・可読性・安全性・保守性の高いコード
- Dart の言語機能を適切に使いこなせているか
- テスト
  - テストが導入しやすい構成
  - Unit・UI テストがある
- UI/UX
  - エラー発生時の処理
  - 画面回転・様々な画面サイズ対応
  - Theme の適切な利用・ダークモードの対応
  - 多言語対応
  - アニメーションなど
- CI/CD
  - ビルド
  - テスト
  - リント
  - フォーマット
  - 仮のデプロイ環境

上記以外でも高く評価できるポイントがあれば同等に考慮します。

アピールする点があれば、README に箇条書きなどで記載してください。

## 参考記事

評価ポイントについて詳しくまとめた記事がありますので、ぜひご覧ください。

- [私が（iOS エンジニアの）採用でコードチェックする時何を見ているのか](https://qiita.com/lovee/items/d76c68341ec3e7beb611)
- [ゆめみの Android の採用コーディング試験を公開しました](https://qiita.com/blendthink/items/aa70b8b3106fb4e3555f)

## AI サービスの利用について

ChatGPT 等の AI サービスを利用することは、禁止しておりません。

利用にあたって工夫したプロンプトやソースコメント等をご提出頂くことで、加点評価する場合もあります。(減点評価はありません)

また、弊社コードチェック担当者も AI サービスを利用させていただく場合があります。
AI サービスの利用は差し控えてもらいたい等のご要望があれば、お気軽にお知らせください。

## Mac をお持ちでない場合について

Mac をお持ちでない場合は課題提出時にその旨お伝えください。
iOS に関連するコード、動作をレビュー対象から除外いたします。
