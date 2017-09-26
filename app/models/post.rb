class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_includes_keywords



  def title_includes_keywords
    phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    unless self.title != nil && phrases.any? do |phrase|
      self.title.include?(phrase)
    end
      errors.add(:title, "True Facts")
    end
  end

end
