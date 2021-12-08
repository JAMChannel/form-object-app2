## フォームオブジェクトを使い一括登録フォームを実装する
- 参考記事
https://rails.densan-labs.net/form/bulk_registration_form.html


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

## fields_forとは

#### 一括登録画面では最大5件までの商品が登録可能であること
![](https://gyazo.com/d7a82ac1a3ee3a37b9c31cde19ab626b/raw)