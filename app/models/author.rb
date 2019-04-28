class Author < ActiveRecord::Base

  validate :must_have_name, :name_must_be_unique, :has_long_enough_phone_number

  #validations
  def must_have_name
    if name.present? == false
      errors.add(:name, "Author must have a name")
    end
  end

  def name_must_be_unique

    author_names = Author.all.map do |author|
      author.name
    end

    if name.present? == true && author_names.include?(name) == true
      errors.add(:name, "Author name already exists")
    end

  end

  def has_long_enough_phone_number
    if phone_number.present? == true && phone_number.length != 10
      errors.add(:phone_number, "Phone Number is not long enough")
    end
  end

  


end
