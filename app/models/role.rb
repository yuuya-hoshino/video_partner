class Role < ActiveHash::Base
  self.data = [
    { id: 1, name: '投稿者' },
    { id: 2, name: '編集者' },
    { id: 3, name: 'ディレクター' },
    { id: 4, name: '指導・レクチャー' }
  ]
end