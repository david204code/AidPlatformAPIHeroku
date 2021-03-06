# Rails.application.config.middleware.insert_before 0, Rack::Cors do 
#   allow do
#     origins '*'
#     # origins 'http://localhost:3000'
#     # origins `https://frontendaidplatformheroku.herokuapp.com/`

#     resource '*',
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head],
#       credentials: true
#   end
# end 

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins '*'
    origins 'https://frontendaidplatformheroku.herokuapp.com'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
