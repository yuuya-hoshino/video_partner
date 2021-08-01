class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'YouTube' },
    { id: 2, name: 'ニコニコ動画' },
    { id: 3, name: 'TikTok' },
    { id: 4, name: 'イチナナ' },
    { id: 5, name: 'ツイキャス' },
    { id: 6, name: 'その他' }
  ]
end