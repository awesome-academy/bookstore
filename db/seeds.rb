Category.create!  name: "Science fiction",
                  description: "Science fiction book"
Category.create!  name: "Psychology",
                  description: "Psychology book"
Category.create!  name: "Comics",
                  description: "Comics book"
Category.create!  name: "Romance",
                  description: "Romance book"
Category.create!  name: "Mystery",
                  description: "Mystery book"

Book.create!(title:  "Tokyo Hoàng Đạo Án",
             id: "1",
             publisher: "Nhã Nam",
             price: 160000,
             quantity_in_store: "6",
             image: Rails.root.join("app/assets/images/kyoto.jpg").open,
             category_id: "1",
             description: "Theo chân Lôi Mễ đi qua 2 cuốn tiểu thuyết, khả năng phân tích phán đoán tâm lý của mình cũng có tiến bộ đôi chút. Phải nói rằng, lúc đầu, có quá nhiều chi tiết, có quá nhiều nhân vật và mình không thể xâu chuỗi và tìm ra thủ phạm. Suy nghĩ cả buổi chiều, cuối cùng, suy đoán của mình cũng đúng.Khi tấm màn bí mật lộ ra, mình thật sự thật sự hạnh phúc và vui mừng. Không phải mừng vì truyện hay và vui mừng vì khả năng phán đoán ban đầu của mình rất chính xác. ")

Book.create!(title:  "Phía sau nghi can X",
             id: "2",
             publisher: "Nhã Nam",
             price: 190000,
             quantity_in_store: "2",
             image: Rails.root.join("app/assets/images/book2.jpg").open,
             category_id: "2",
             description: "Việc Togashi đột ngột xuất hiện sau 5 năm li dị đã thay đổi cuộc đời Yasuki hoàn toàn, gã đeo bám chị không dứt, buổi tối định mệnh đó sau một hồi giằng co chị vô tình giết Togashi. ")

Book.create!(title:  "Bạch Dạ Hành",
             id: "3",
             publisher: "Nhã Nam",
             price: 190000,
             quantity_in_store: "3",
             image: Rails.root.join("app/assets/images/book3.jpg").open,
             category_id: "3",
             description: "Việc Togashi đột ngột xuất hiện sau 5 năm li dị đã thay đổi cuộc đời Yasuki hoàn toàn, gã đeo bám chị không dứt, buổi tối định mệnh đó sau một hồi giằng co chị vô tình giết Togashi. ")

Book.create!(title:  "Đứa trẻ hư",
             id: "4",
             publisher: "Nhã Nam",
             price: 190000,
             quantity_in_store: "4",
             image: Rails.root.join("app/assets/images/book4.jpg").open,
             category_id: "4",
             description: "Việc Togashi đột ngột xuất hiện sau 5 năm li dị đã thay đổi cuộc đời Yasuki hoàn toàn, gã đeo bám chị không dứt, buổi tối định mệnh đó sau một hồi giằng co chị vô tình giết Togashi. ")

Book.create!(title:  "Bill Gates: Tham Vọng Lớn Lao Và Quá Trình Hình Thành Đế Chế Microsoft (Tái Bản 2017)",
             id: "5",
             publisher: "Nhã Nam",
             price: 190000,
             quantity_in_store: "5",
             image: Rails.root.join("app/assets/images/book5.jpg").open,
             category_id: "5",
             description: "Việc Togashi đột ngột xuất hiện sau 5 năm li dị đã thay đổi cuộc đời Yasuki hoàn toàn, gã đeo bám chị không dứt, buổi tối định mệnh đó sau một hồi giằng co chị vô tình giết Togashi. ")

Book.create!(title:  "Steve Jobs - Những Bí Quyết Đổi Mới Và Sáng Tạo (Tái Bản 2017)",
             id: "6",
             publisher: "Nhã Nam",
             price: 190000,
             quantity_in_store: "6",
             image: Rails.root.join("app/assets/images/book6.jpg").open,
             category_id: "1",
             description: "Việc Togashi đột ngột xuất hiện sau 6 năm li dị đã thay đổi cuộc đời Yasuki hoàn toàn, gã đeo bám chị không dứt, buổi tối định mệnh đó sau một hồi giằng co chị vô tình giết Togashi. ")

7.upto(25) do |n|
  title = "book#{n}"
  publisher = "Publisher-#{n+1}"
  des = "Book-#{n} description"
  Book.create!(title: title,
             publisher: "Nhã Nam",
             price: 190000,
             quantity_in_store: rand(1..10),
             image: Rails.root.join("app/assets/images/book#{n}.jpg").open,
             category_id: rand(1..5),
             description: des)
end

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


20.times do |n|
name  = FFaker::Name.name
User.create! name: name,
             email: "user#{n+1}@example.com",
             password: "111111",
             password_confirmation: "111111",
             dob: "1/1/1991",
             is_admin: false,
             payment_id: 1
end

User.create! name: "Admin1",
             email: "admin-1@example.com",
             password: "111111",
             password_confirmation: "111111",
             dob: "1/1/1991",
             is_admin: true,
             payment_id: 1

User.create! name: "Admin2",
             email: "admin-2@example.com",
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

15.times do |n|
  AuthorBook.create!(book_id: n+1, author_id: rand(1..10))
end

10.times do |n|
   AuthorBook.create!(book_id: n+10, author_id: rand(1..10))
end
