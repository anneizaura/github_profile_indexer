class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :url, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:name, :url, :nick_name, :followers, :following, :stars, :contributions, :organization, :location],
    using: {
      tsearch: { prefix: true }
    }
end
