5.times do |n|
  type = "Payment type #{n+1}"
  des = "Payment for user"
  Payment.create! payment_type: type, description: des
end

User.create! name: "Admin",
             email: "admin@example.com",
             password: "111111",
             password_confirmation: "111111",
             dob: "1/1/1991",
             is_admin: true,
             payment_id: 1

10.times do |n|
  name = FFaker::Name.name
  birthday = "10/10/1960"
  Author.create! name: name,
                birthday: birthday
end

5.times do |n|
  name = "Category-#{n+1}"
  description = "Book type #{n+1}"
  Category.create! name: name,
                  description: description
end

30.times do|n|
  title = "Book-#{n+1}"
  publisher = "Publisher-#{n+1}"
  des = "Book-#{n+1} description"
  Book.create!(title: title, publisher: publisher, price: 10000,
    quantity_in_store: rand(1..10), desciption: des, category_id: rand(1..5))
end

30.times do |n|
  AuthorDetail.create!(book_id: n+1, author_id: rand(1..10))
end

10.times do |n|
   AuthorDetail.create!(book_id: n+10, author_id: rand(1..10))
end
