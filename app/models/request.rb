class Request < ApplicationRecord
  belongs_to :user
  belongs_to :hen
  validate :ending_is_possible?

  def ending_is_possible?
    return if [ending.blank?, beginning.blank?].any?
    if beginning > ending
      errors.add(:ending, 'must be possible')
    end
  end
end
