class Part < ApplicationRecord
  belongs_to :actor
  belongs_to :movie
end
