# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: "Javier", lastname: "Diaz", email: "javierdiazt406@gmail.com", password: '12345678')
User.create(name: "Evanan", lastname: "Semprun", email: "evanansemprun@gmail.com", password: '12345678')

Task.create(title: "Comprar el pan", description: "Comprar el pan en la Ritz", user_id: 1)
Task.create(title: "Comprar un Xiaomi", description: "why evehyone is praise mi,,,,do u all know Realme exist and better than xiaome take look at realme narzo 20 pro G95 65W dart charge 90hz ultra smooth display 4500mAh for just a mere 15k inr well priced realme this year sucked for xoaomi,, realme 6 killed note 9 mi selling $1000 flagship with no ip rzting they supposed be flaghip killer,, Poco f2 pro not flagsjip killer its just another $550 phone nothing special, xiaomi selling $700 mi 10t with lcd wtf mi all phone above $300 should have amoled, xiaomi allergic to high refresh rate in budget phone except poco x3, good 2020 mi phone is china only phone like redmi 10x 5g and k30 ultra amd poco rebranded redmi and miui keep getting worst buggy crap lag softsare realme ui much better and realme relase killer phone to global like realme x7 pro realme 6 realme 7 realme 7 pro narzo 20 pro even realme 6 better than 9s and realme ui getting better and better take look at realme ui 2 while oxygenos and miui getting wprse and worst only good 2020 mi phone is Poco x2 poco x3 redmi 10x 5g china only :( k30 ultra china only :(,, shame on redmi,,, im using realme narzo 20 pro and better than any redmi note phones", user_id: 2)
Task.create(title: "Visitar a Edmundo", description: "Ver a edmundo", user_id: 2)
