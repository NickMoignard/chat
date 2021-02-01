class Forum
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String

  has_and_belongs_to_many :users
  has_many :posts
end
