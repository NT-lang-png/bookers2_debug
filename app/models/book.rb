class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def self.search_for(content,method)
    if method == "perfect"
      Book.where(title: content)
    elsif method == "forward"
      Book.where('title LIke?', content + '%')
    elsif method == "backward"
      Book.where('title LIKE?', '%' + content )
    else
      Book.where('title LIKE?', '%' + content + '%' )
    end
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
