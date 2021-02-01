class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String
  # field :depth, type: Integer, :default => 0
  # field :path, type: String, :default => ''

  # field :parent_id, type: String

  validates_presence_of  :body
  # after_create :set_path
  belongs_to :post
  belongs_to :user

  # TODO #3 #2 Add Nested Comments to Posts
  private

  # def set_path
  #   unless self.parent_id.blank?
  #     parent = Comment.find(self.parent_id)
  #     self.post_id = parent.post_id
  #     self.depth = parent.depth + 1
  #     self.path = parent.path + ":" + parent.id
  #   end
  #   save
  # end


end
