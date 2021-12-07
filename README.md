## フォームオブジェクトを使い一括登録フォームを実装する

- 商品コード
- 商品名
- 価格
これらを最大5件登録できるフォームを作成してください。
チェックボックスを入れたものだけ登録される仕組みです。

 #### モデルを作成
```
rails g model product
```

```
  def change
    create_table :products do |t|
      t.string  :code,          null: false
      t.string  :name,          null: false
      t.integer :price,         null: false
      t.timestamps
    end
  end
```


 ### コントローラー
```
rails g controller products index new 
```

## form object 準備
https://github.com/nishio-dens/rails-application-build-guide-sample/tree/master/form/bulk_registration_form_example/app/models


一括登録画面では最大5件までの商品が登録可能であること
以下条件を満たす商品のみ登録可能とする
登録チェックボックスにチェックがある商品のみ登録可能とする
チェックのない商品のバリデーションはスキップすること
各種バリデーションが通っている商品のみ登録可能とする
バリデーションを満たしていない場合はエラーメッセージを表示すること

