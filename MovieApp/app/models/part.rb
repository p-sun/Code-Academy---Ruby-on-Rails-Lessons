class Part < ApplicationRecord
  # Add foreign keys that point to the movie and actor tables.
  belongs_to :actor
  belongs_to :movie
end
