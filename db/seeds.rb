# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Education.create(eduName:"SLC ")
Education.create(eduName:"Intermediate")
Education.create(eduName:"Diploma ")
Education.create(eduName:"Bachelor")
Education.create(eduName:"Master")
Education.create(eduName:"Ph.D.")

Category.create(name: "IT & Telecommunication")
Category.create(name: "Programmer")
Category.create(name: "Software Engineer")
Category.create(name: "Programmer")
Category.create(name: "Chartered Accountancy")
Category.create(name: "Graphic Designer")
Category.create(name: "Administration")
Category.create(name: "Banking")

Skill.create(name:"Ruby On Rails")
Skill.create(name:"Java")
Skill.create(name:"Python")
Skill.create(name:"ASP.net")
Skill.create(name:"Leadership")
Skill.create(name:"Communication")
Skill.create(name:"Research")
Skill.create(name:"Writing")
Skill.create(name:"Reading")
Skill.create(name:"Teamwork")
Skill.create(name:"Problem Solving")
Skill.create(name:"Accountability")
Skill.create(name:"Driving")
Skill.create(name:"Troubleshooting")
Skill.create(name:"Data analysis")
Skill.create(name:"Strategic Planning")
Skill.create(name:"Coordinating")
Skill.create(name:"Strategic thinking")
Skill.create(name:"Coaching")
Skill.create(name:"Decision making")
Skill.create(name:"Advising")



100.times do |x|
    Seeker.create({ email:Faker::Internet.email,
                    password: "aaaaaa"
      })
      SeekerProfile.create({ first_name: Faker::Name.first_name ,
                              last_name: Faker::Name.last_name,
                              phone_no: Faker::PhoneNumber.cell_phone,
                              prefered_loc:  Faker::Address.full_address,
                              salary: rand(1000..10000),
                              nationality: "Nepalese",
                              sex: "male",
                              perm_address:  Faker::Address.city,
                              temp_address:  Faker::Address.city,
                              experience: rand(1..3),
                              description: Faker::Lorem.paragraphs,
                              job_status: [true, false].sample,
                              certificate: "",
                              seeker_id: 1

        })
end
90.times do |x|
  Recuitor.create({ email:Faker::Internet.email,
                    password: "aaaaaa"
    })
    RecuitorProfile.create({ company_name: Faker::Company.name,
                              contact_no: Faker::PhoneNumber.cell_phone,
                              address:  Faker::Address.full_address,
                              pan_no: Faker::Company.duns_number,
                              description: Faker::Lorem.paragraphs,
                              recuitor_id: x+1,
                              industry: Faker::Company.industry,
                              website: "www.testsite.com",
                              email: "test@test.com"


      })
end





100.times do |x|
SeekerCategory.create(category_id: rand(1..8),
                      seeker_profile_id: x+1
                      )
SeekerSkill.create(skill_id: rand(1..20),
                    seeker_profile_id: x+1
                      )
SeekerEducation.create(education_id: rand(1..6),
                      seeker_profile_id: x+1,
                      year: rand(2000..2018),
                      colzname: Faker::University.name
                      )
end

100.times do |x|
  JobPost.create({
    job_title: Faker::Job.title,
    no_of_vacancies: rand(1..5),
    experience: rand(1..5),
    description:Faker::Lorem.paragraph,
    department: Faker::Job.field,
    job_type: Faker::Job.employment_type,
    recuitor_id: rand(1..90),
    location: Faker::Address.city,
    deadline: ""
    })

    JobCategory.create({category_id: rand(1..8),
                          job_post_id: x+1
                          })
    JobSkill.create({skill_id: rand(1..20),
                        job_post_id: x+1
                          })
    JobEducation.create({education_id: rand(1..6),
                          job_post_id: x+1
                          })
end
