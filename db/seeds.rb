#require 'securerandom'
require 'bcrypt'
require './db_class.rb'

meeting_detail = MeetingDetail.create("starting_date"=>DateTime.new(2019,1,24,10), "mid_date"=>DateTime.new(2019,1,25,10), "meeting_date"=>DateTime.new(2019,1,25,22), \
"location"=>"Gangnam", "cutline"=>"0")
# I don't know exactly.... about datetime....

for i in 1..20 #for men
    j = i % 4 + 1

    company = Company.create(
        "name"=>"BRGG#{j}",
        "domain"=>"@#{j}mail.com")
    company.save

    a=Company.find_by_id(i)

    user = User.create(
        "company_id" => a.id,
        "current_heart" => i,
        "nickname"=>"user#{i}",
        "email"=>"#{i}@#{i}mail.com",
        "password"=>BCrypt::Password.create("abc#{i}#{i}#{i}#{i}"),
        "phone_number"=>"#{i}#{i}#{i}-#{i}#{i}#{i}#{i}-#{i}#{i}#{i}#{i}",
        "location"=>"Gangnam",
        "profile_img"=>"/public/images/guest#{j}",
        "recommendation_code"=>"abcd#{i}#{i}",
        "team_detail"=>"Hi Nice to meet you",
        "is_male"=>true,
        "created_at"=>Time.now())
    user.save

    b=User.find_by_id(i)

    joined_user = JoinedUser.create(
        "user_id"=>b.id,
        "is_male"=>b.is_male,
        "meeting_detail_id"=>1,
        "total_score"=>0,
        "ranking"=>i,
        "midranking"=>i,
        "is_deleted"=>false,
        "created_at"=>Time.now())
    joined_user.save
end

for i in 21..30 #for women
    j = i % 4 + 1

    company = Company.create(
        "name"=>"BRGG#{j}",
        "domain"=>"@#{j}mail.com")
    company.save

    a=Company.find_by_id(i)

    user = User.create(
        "company_id" => a.id,
        "current_heart" => i,
        "nickname"=>"user#{i}",
        "email"=>"#{i}@#{i}mail.com",
        "password"=>"abc#{i}#{i}#{i}#{i}",
        "phone_number"=>"#{i}#{i}#{i}-#{i}#{i}ㄴ#{i}#{i}-#{i}#{i}#{i}#{i}",
        "location"=>"Gangnam",
        "profile_img"=>"/public/images/guest#{j}",
        "recommendation_code"=>"abcd#{i}#{i}",
        "team_detail"=>"Hi Nice to meet you",
        "is_male"=>false,
        "created_at"=>Time.now())
    user.password = BCrypt::Password.create(user.password)
    user.save

    b=User.find_by_id(i)

    joined_user = JoinedUser.create(
        "user_id"=>b.id,
        "is_male"=>b.is_male,
        "meeting_detail_id"=>1,
        "total_score"=>0,
        "ranking"=>i,
        "midranking"=>i,
        "is_deleted"=>false,
        "created_at"=>Time.now())
    joined_user.save
end