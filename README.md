# gh-cargo


GitHub extension で、rust のビルド環境を構築します。

## 説明

gh cargo を使って、面倒な、環境構築を簡単にして、すぐに、rust プログラミング言語の学習ができます。

## インストール / アンインストール / アップグレード

```sh
gh ext install kouji-sasaya/gh-cargo
```

```sh
gh ext remove kouji-sasaya/gh-cargo
```

```sh
gh ext upgrade cargo
```

## セットアップ

rust プログラミングの学習環境は、docker コンテナ内で、作業できます。

引数なしの `setup` は Docker イメージをビルドします。

Docker を使わず、ホストコンピュータへ Rust のビルド環境を直接セットアップすることもできます。

プロキシ環境では、ホスト側の `http_proxy` / `https_proxy` / `no_proxy` を設定しておくと、Docker build に自動で引き継がれます。


```sh
gh cargo setup
```

Docker のセットアップを明示する場合:

```sh
gh cargo setup --docker
```

ホスト側へセットアップする場合:

```sh
gh cargo setup --host
```

`--host` は、Rust stable、rustfmt、`cargo-audit`、`just` とビルドに必要な Debian/Ubuntu のパッケージをホストへインストールします。

## クリーンアップ

Docker イメージとホスト側の Rust ツールを両方削除します。`cleanup` のデフォルトは `--all` です。

```sh
gh cargo cleanup
gh cargo cleanup --all
```

Docker イメージだけ削除する場合:

```sh
gh cargo cleanup --docker
```

ホスト側の Rust ツールと `just` を削除する場合:

```sh
gh cargo cleanup --host
```

## 学習

まっさらな、ディレクトリを作成し、hello worldを、rust コンパイラでビルドして、実行します。

デバッグ版のビルド方法と、リリース版のビルド方法を学びます。

フォーマッターを使って、rust コードを成形できます。

### docker コンテナでシェルを使う

```sh
mkdir my-rust && cd my-rust
gh cargo shell
```

`gh cargo shell` はホスト側のプロキシ環境変数をコンテナ内へ引き継ぎます。


### Building with cargo

hello world作成

```sh
cargo init
```

ビルド（デバッグ版）

```sh
cargo build
```

ビルド（リリース版）

```sh
cargo build --release
```

チェック

```sh
cargo check
```

実行

```sh
cargo run
```

実行（非表示）

```sh
cargo run -q
```

ソースコードの成形

```sh
cargo fmt
```

### Building with just

just コマンドも入れています。cargo コマンドを、まとめることもできます。

```
just
```


# ライセンス

MIT License

Copyright (c) Kouji Sasaya

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

