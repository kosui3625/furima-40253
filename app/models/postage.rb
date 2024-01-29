class Postage < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '300' },
    { id: 3, name: '400' },
    { id: 4, name: '500' },
    { id: 5, name: '600' },
    { id: 6, name: '700' },
    { id: 7, name: '800' },
    { id: 8, name: '900' },
    { id: 9, name: '1000' },
    { id: 10, name: '2000' }
  ]
 
   include ActiveHash::Associations
   has_many :articles
 
  end