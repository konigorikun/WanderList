class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '建造物' },
    { id: 3, name: 'ホテル,旅館' },
    { id: 4, name: 'グルメ,料理' },
    { id: 5, name: '自然' },
    { id: 6, name: '世界遺産' },
    { id: 7, name: 'ショップ' },
    { id: 8, name: 'アクセサリー,雑貨' },
    { id: 9, name: 'スポーツ' },
    { id: 10, name: 'ビーチ' },
    { id: 11, name: '人々' },
    { id: 12, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :posts

  end