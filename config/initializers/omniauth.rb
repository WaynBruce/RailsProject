Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '394691814307149', '9cb22ef1624c116c0778628f48c4e02a'
    provider :twitter, 'HmoJecJ4z3uRrq5xAzrUPrAQl', 'wCw04ExVfEkB0cLSOXVTuVOwxZYnEkgsokkRErhstxMT77ljiq'
  end

