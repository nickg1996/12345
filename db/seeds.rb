# frozen_string_literal: true

def create_seed_user(is_admin = false, first_name = Faker::Name.first_name, last_name = Faker::Name.last_name, email = nil)
  full_name = "#{first_name} #{last_name}"
  final_email = email ||= Faker::Internet.safe_email(name: full_name)
  p "Final Email: #{final_email}"
  user = User.find_or_initialize_by(email: final_email.downcase)
  if user.new_record?
    user.password = 'test1234'
    user.role = User::ADMIN_ROLE if is_admin
    if user.save
      p "User:    #{final_email} has been saved for #{first_name} #{last_name}"
    else
      raise user.errors.full_messages.to_s
    end
  end

  user
end

def create_article(user = create_seed_user(true))
  article = Article.new
  article.title = "Will #{Faker::Company.name} really #{Faker::Company.bs}?"
  paragraph_1 = Faker::Lorem.paragraphs.join(' ')
  paragraph_2 = Faker::Books::Lovecraft.paragraphs.join(' ')
  paragraph_3 = Faker::Hipster.paragraphs.join(' ')
  article.content = "#{paragraph_1} <br /> #{paragraph_2} <br /> #{paragraph_3}"
  article.user = user
  if article.save
    p "#{article.title} has been saved"
  else
    raise article.errors.full_messages.to_s
  end
  article
end

def create_comment(article = create_article, user = create_seed_user)
  comment = Comment.new
  comment.article = article
  comment.message = Faker::Hacker.say_something_smart
  comment.user = user
  if comment.save
    comment
    p "Comment #{comment.uuid} has been saved for article #{article.title}"
  else
    raise comment.errors.full_messages.to_s
  end
end

Comment.all.destroy_all
Article.all.destroy_all
User.all.destroy_all

(1..100).each do |_i|
  article = create_article
  next unless article.save

  (1..10).each do |_ii|
    create_comment(article)
  end
end

# This is to create the admin users
create_seed_user(true, 'Andrew', 'Raymer', 'AndrewRaymer@example.com')
