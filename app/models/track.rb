class Track < ActiveRecord::Base
  TRACK_TYPE = [
    "BONUS",
    "REGULAR"
  ]
  validates :name, :album_id, :track_type, :lyrics, presence: true
  validates :track_type, inclusion: TRACK_TYPE

  belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id
  )

  has_one(
    :band,
    through: :album,
    source: :band
  )
  has_many(
    :notes,
    class_name: "Note",
    foreign_key: :track_id,
    primary_key: :id
  )
end
