class Role < ActiveHash::Base
  self.data = [
    { id: 1, name: '投稿者' },
    { id: 2, name: '編集者' }
  ]
end