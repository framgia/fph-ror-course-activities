class User < ApplicationRecord
  # If you edit validations, it doesn't update instantly in RAILS CONSOLE
  # This is because it does not update in real time
  has_many :microposts, dependent: :destroy
  # You are FOLLOWING, you become the follower
  has_many :active_relationships, class_name: "Relationship",
                                foreign_key: "follower_id",
                                dependent: :destroy
  # Others are following you, you became the following
  has_many :passive_relationships, class_name: "Relationship",
                                foreign_key: "followed_id",
                                dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # BANG (!) method -> shows what you want and saves what you want
  # Example of email: BRENDON.URIE@sun-asterisk.com
  # Original: before_save { self.email = email.downcase }
  # This results to showing all lowcase -> bredon.urie@sun-asterisk.com
  # But in the database it saves as BRENDON.URIE@sun-asterisk.com
  #
  # But when using before_save { email.downcase! }
  # This results to showing all lowcase -> bredon.urie@sun-asterisk.com
  # AND in the database it saves as bredon.urie@sun-asterisk.com
  before_save { email.downcase! }

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  # Source for secure email: https://rubular.com/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  # Hashed password
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }, allow_blank: true
  # Without allow_blank: true
  # -> has_secure_password & validates will send the same message at the same time
  # presence: true                    # nil and empty string fail validation
  # presence: true, allow_blank: true # nil fails validation, empty string passes
  # This allows the validates to be true and pass which leaves only the has_secure_password to send msg
  # Ref: https://books.google.com.ph/books?id=ePuCDQAAQBAJ&pg=PT564&lpg=PT564&dq=allow_blank:+true+has_secure_password&source=bl&ots=0yvJ8IJ34J&sig=ACfU3U34pZQMB4zLblF-3KS_MlxaFxy6lA&hl=en&sa=X&ved=2ahUKEwiFkZqhsZjqAhXVQN4KHZF5A9oQ6AEwAHoECAoQAQ#v=onepage&q=allow_blank%3A%20true%20has_secure_password&f=false

  # See "Following users" for the full implementation.
  def feed
    # Micropost.where("user_id = ?", id)
    following_ids = "SELECT followed_id FROM relationships
                      WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids})
                      OR user_id = :user_id", user_id: id)
  end

  # Follows a user.
  def follow(other_user)
    following << other_user
  end
    # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end
    # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
