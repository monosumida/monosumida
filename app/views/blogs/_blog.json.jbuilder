json.extract! blog, :id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
