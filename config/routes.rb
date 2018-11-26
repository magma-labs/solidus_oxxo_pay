Spree::Core::Engine.routes.draw do
  post 'oxxo-pay', to: 'conekta_oxxo#create'
end
