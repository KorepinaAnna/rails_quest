class Mission < ApplicationRecord
  belongs_to :agent

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: %w[assigned in_progress completed] }

  def status=(value)
    raise ArgumentError unless value.blank? || %w[assigned in_progress completed].include?(value)
    super
  end
end
