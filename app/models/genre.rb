class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '0~1年' },
    { id: 3, name: '1~5年' },
    { id: 4, name: '5~10年' },
    { id: 5, name: '10年以上' }
  ]
end