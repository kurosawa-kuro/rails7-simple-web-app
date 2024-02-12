# db/seeds.rb

# ユーザーのサンプルデータ
users = User.create([
  { name: '田中 太郎', email: 'tanaka@example.com', password: 'password', is_admin: false, avatar: 'tanaka.png' },
  { name: '鈴木 一郎', email: 'suzuki@example.com', password: 'password', is_admin: false, avatar: 'suzuki.png' },
  { name: '佐藤 次郎', email: 'sato@example.com', password: 'password', is_admin: true, avatar: 'sato.png' }
])

# カテゴリーのサンプルデータ
categories = Category.create([
  { title: '勉強' },
  { title: '仕事' },
  { title: '趣味' }
])

# Todo項目のサンプルデータ
todos = Todo.create([
  { user: users.first, title: 'Rails勉強会の資料作成', categories: [categories.first,categories.second,categories.third] },
  { user: users.second, title: 'プロジェクトの進捗報告', categories: [categories.second,categories.third] },
  { user: users.third, title: '新しいギターの購入', categories: [categories.third] }
])

# 中間テーブルのサンプルデータは、Todo作成時にカテゴリーを指定することで自動的に作成されます。
