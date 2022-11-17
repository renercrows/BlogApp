# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Tiago',
    photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s',
    bio: 'Teacher from Brazil.', email: 'tiago@gmail.com', password: '123456')
user2 = User.create(name: 'Jake',
    photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s',
    bio: 'Teacher from Eritrea.', email: 'jake@gmail.com', password: '123456')
user3 = User.create(name: 'Lui',
    photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s',
    bio: 'Teacher from Thailand.', email: 'lui@gmail.com', password: '123456')
user4 = User.create(name: 'Sabrina',
    photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s',
    bio: 'Teacher from Kenya.', email: 'sabrina@gmail.com', password: '123456')
user5 = User.create(name: 'Carl',
    photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s',
    bio: 'Teacher from Venezuela.', email: 'carl@gmail.com', password: '123456')

post1 = Post.create(user: user1, title: 'Title 1', text: 'This is my first post')
post2 = Post.create(user: user2, title: 'Title 1', text: 'This is my post')

Comment.create(post_id: post1, user_id: user2, text: 'Hi There Girl!')
Comment.create(post_id: post2, user_id: user1, text: 'Hi There Man!')
