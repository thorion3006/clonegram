class User
    include ActiveModel::Model

    attr_accessor :access_token, :username, :profile_picture
    validates :access_token, :username, presence: true
end