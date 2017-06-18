Rails.application.routes.draw do
  Rails.application.secrets.telegram[:path].tap do |path|
    post path => 'web_hooks#telegram' if path.present?
  end

  resources 'settings', only: [:index]
  # root to: 'settings#index'
end