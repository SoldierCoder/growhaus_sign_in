# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db
# with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create roles
roles = ["Volunteer", "Visitor", "Intern"]
roles = roles.map do |t|
  Role.find_or_create_by(name: t)
end

# Create activities
activities_volunteer = ["Food Box Sorting", "Cosechando Salud",
                        "Hydroponics Farm", "Aquaponics Farm", "Growasis",
                        "Mushroom Farm", "Education",
                        "Marketing/Communications", "Spanish Translation",
                        "Construction/Facilities", "Graphic Design",
                        "Special Event", "Other"]

activities_intern = ["Hydroponics Farm", "Aquaponics Farm",
                     "Executive Assistant Intern", "Communication Intern",
                     "Digital Design Intern", "Service Learning Intern",
                     "Community Education Intern", "Food Distribution Intern",
                     "Development Intern"]

activities_volunteer.each do |a|
  activity = Activity.find_or_create_by(name: a)
  activity.role << roles[0] unless activity.role.include? roles[0]
end

activities_intern.each do |a|
  activity = Activity.find_or_create_by(name: a)
  activity.role << roles[2] unless activity.role.include? roles[2]
end
# Create users
User.find_or_create_by(name: "John Volunteer",
                       role: roles[0],
                       waiver_signature: "John Volunteer/s/")
User.find_or_create_by(name: "Jenny Visitor",
                       role: roles[1],
                       waiver_signature: "Jenny Visitor/s/")
User.find_or_create_by(name: "Joseph Intern",
                       role: roles[2],
                       waiver_signature: "Joseph Intern/s/",
                       emergency_contact_name: "Maria Contact",
                       emergency_contact_phone: "800-867-5309")
