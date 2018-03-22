class User < ApplicationRecord
  before_create :set_api_key

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email

  def set_api_key
    return if api_key.present?
    self.api_key = generate_api_key
  end

  def generate_api_key
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
