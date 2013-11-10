Src::Application.routes.draw do
  root to: 'home#Index'

  match '/home/ContactUs', :to => 'home#contactUs', via:[:get, :post]
  match '/home/AboutUs', :to => 'home#aboutUs', via:[:get, :post]

  match '/session/login', :to => 'session#LogIn', via:[:post]
  match '/session/logout', :to => 'session#LogOut', via:[:get, :post]

  match '/account/user', :to => 'account#userAccount', via:[:get, :post]
  match '/account/renew', :to => 'account#renewMembership', via:[:get]
  match '/account/Registration', :to => 'account#userRegisteration', via:[:get]
  match '/account/PasswordRecovery', :to => 'account#userPasswordRecovery', via:[:get, :post]
  match '/account/renewSubscription', :to => 'account#renewExistingSubscription', via:[:post]
  match '/account/newUserScuscription', :to => 'account#newUserScuscription', via:[:post]

  match '/restaurant/search',	:to => 'restaurant#searchRestaurant', via:[:get, :post]
  match '/restaurant/restaurantDetail', :to => 'restaurant#restaurantDetail', via:[:get, :post]
end
