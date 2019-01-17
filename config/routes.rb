Spree::Core::Engine.routes.draw do
  get 'oxxo-pay/receipt', to: 'conekta_oxxo#receipt'
  post 'oxxo-pay', to: 'conekta_oxxo#create'
end
