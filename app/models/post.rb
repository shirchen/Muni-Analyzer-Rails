class Post
  include MongoMapper::Document

  key :name, String
  key :title, String

end
