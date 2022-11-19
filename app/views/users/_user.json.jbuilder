json.extract! user, :id, :name, :url, :nick_name, :followers, :following, :stars, :contributions, :organization, :location, :created_at, :updated_at
json.url user_url(user, format: :json)
