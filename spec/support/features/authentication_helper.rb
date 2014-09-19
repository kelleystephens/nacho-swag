module Features
  module AuthenticationHelpers

    def sign_into_eventful_as(user_or_username)
      if user_or_username.is_a? User
        user = user_or_username
      end

      username = user_or_username.try(:eventful_username) || user_or_username
      uid = user_or_username.try(:eventful_uid) || user_or_username
      name = user.try(:name) || "Joe Smith"

      OmniAuth.config.add_mock(:eventful, {
        uid: uid,
        provider: "eventful",
        info: {
          username: username,
          name: name,
        },
        extra: {
          raw_info: {
            location: 'San Francisco',
            bio: "My info here"
          }
        }
      })
    end
  end
end

RSpec.configure do |config|
  config.include Features::AuthenticationHelpers, type: :feature
end
