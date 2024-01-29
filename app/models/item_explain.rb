class item_explain < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '新品未開封' },
    { id: 3, name: 'かなり良い' },
    { id: 4, name: '良い' },
    { id: 5, name: '使用済' },
    { id: 6, name: '汚損あり' },
    { id: 7, name: '破損あり' },
    { id: 8, name: 'その他' }
  ]
  end