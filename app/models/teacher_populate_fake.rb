require 'faker'

# task :console do
#   exec "irb -r./app.rb"
# end

namespace :db do
  task :seed do
    require_relative 'teacher'
    # cohort_names = %w(Alpha Beta Delta Gamma Epsilon Zeta Eta Theta Iota)

    # cohort_ids = cohort_names.map do |name|
    #   Cohort.create(:name => name)[:id]
    # end

    7.times do
      Teacher.create :name => Faker::Name.first_name,
                     :email => Faker::Internet.email,
                     :phone  => Faker::PhoneNumber.phone_number
    end
  end

  task :setup do
    require_relative 'app.rb'

    print "Creating database at #{Database::Model.filename}..."

    Database::Model.execute(<<-SQL)
      CREATE TABLE "students" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        "cohort_id" integer,
        "first_name" varchar(255),
        "last_name" varchar(255),
        "email" varchar(255),
        "gender" varchar(255),
        "birthdate" date,
        "created_at" datetime NOT NULL,
        "updated_at" datetime NOT NULL
      );
    SQL

    Database::Model.execute(<<-SQL)
      CREATE TABLE "cohorts" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        "name" varchar(255),
        "created_at" datetime NOT NULL,
        "updated_at" datetime NOT NULL
      );
    SQL

    puts "done"
  end
end
