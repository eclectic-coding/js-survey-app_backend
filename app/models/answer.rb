class Answer < ApplicationRecord
  belongs_to :survey, optional: true

end
