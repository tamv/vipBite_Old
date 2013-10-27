Src::Application.routes.draw do
  root to: 'home#Index'

  match '/login', 		:to => 'session#LogIn', 			via:[:post]
  match '/logout', 		:to => 'session#LogOut', 			via:[:get, :post]
  match '/account',		:to => 'account#userAccount', 		via:[:get, :post]
  match '/renew',		:to => 'account#renewMembership',	via:[:get, :post]

  match '/search',		:to => 'restaurant#searchRestaurant',	via:[:get, :post]
end
