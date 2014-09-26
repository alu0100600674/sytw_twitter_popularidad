def my_twitter_client
  Twitter::REST::Client.new do |config|
    config.consumer_key        = 'CW3EsjesFhPM5VmEVSkrlahHf'
    config.consumer_secret     = 'RV80jyJb16PNYQeJ1tnfIk2aceWMifvHOtUz8thjV6toCLbGXi'
    config.access_token        = '201502306-jWqi3OYxqfmBNy3OgMKrzXHR9SMd3zTzZ67CLtEm'
    config.access_token_secret = 'pSYmER2788lXMb71nopyUQIDxzszj0OEDmIqgdO4POmSu'
  end
end