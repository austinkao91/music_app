class Note < ActiveRecord::Base
  validates :track_id, :user_id, :body, presence: true

  belongs_to(
    :track,
    class_name: "Track",
    foreign_key: :track_id,
    primary_key: :id
  )

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
end
