class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  # field :url, type: String 
  # field :slug, type: String
  # field :voters, type: Array
  # field :up_votes, type: Integer, :default => 0
  # field :down_votes, type: Integer, :default => 0
  # field :relevance, type: Integer, :default => 0

  # cached values
  # field :comment_count, type: Integer, :default => 0
  # field :username, type: String

  validates_presence_of :title, :body #, :user_id, :url

  belongs_to :forum
  belongs_to :user
  has_many :comments

  # def self.add_up_vote
  #   self.increment(:up_vote, 1)
  # end

  # def self.add_down_vote
  #   self.decrement(:down_vote, 1)
  # end
end
