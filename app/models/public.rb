class Public < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '友達公開' },
    { id: 3, name: '自分のみ' },
  ]

  include ActiveHash::Associations
  has_many :posts
  
  end