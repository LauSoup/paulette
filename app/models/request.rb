class Request < ApplicationRecord
  belongs_to :user
  belongs_to :hen
  validate :beginning_is_possible?
  validate :ending_is_possible?

  def beginning_is_possible?
    return if [ending.blank?, beginning.blank?].any?
    if beginning < Date.today
      errors.add(:beginning, 'must be possible')
    end
  end

  def ending_is_possible?
    return if [ending.blank?, beginning.blank?].any?
    if beginning > ending
      errors.add(:ending, 'must be possible')
    end
  end
end
