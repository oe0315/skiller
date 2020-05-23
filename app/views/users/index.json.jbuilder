json.array! @users do |user|
    json.nickname user.nickname
    json.skill user.skill
    json.second_skill user.second_skill
    json.introduction user.introduction
    json.profile_image user.profile_image
  end