class Post < ActiveRecord::Base

  validate :must_have_title, :content_must_be_250_or_more_characters, :summary_must_be_less_than_250_characters, :category_must_be_fiction_or_nonfiction, :title_is_click_bait






  #validations
  def must_have_title
    if title.present? == false
      errors.add(:title, "Post must have a title")
    end
  end

  def content_must_be_250_or_more_characters
    if content.length < 250
      errors.add(:content, "Content must be at lest 250 characters long")
    end
  end

  def summary_must_be_less_than_250_characters
    if summary.length > 250
      errors.add(:summary, "Summary must be less than 250 characters long")
    end
  end

  def category_must_be_fiction_or_nonfiction
    if category != "Fiction" && category != "Non-Fiction"
      errors.add(:category, "Not a valid category")
    end
  end

  def title_is_click_bait
    if title.present? == true && title.include?("Won't Believe"||"Secret"||"Top[number]"||"Guess") == false
      errors.add(:title, "Title must be click bait, bro")
    end

  end

end
