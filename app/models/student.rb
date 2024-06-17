class Student < ApplicationRecord
  has_and_belongs_to_many :modalities

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :height, presence: true, numericality: { greater_than: 0 }
  validate  :birth_date_in_the_past

  before_save :calculate_bmi

  private

  def birth_date_in_the_past
    return unless birth_date.present? && birth_date > Date.today

    errors.add(:birth_date, 'deve estar no passado')
  end

  def calculate_bmi
    return unless weight.present? && height.present?

    self.bmi = weight / (height**2)
  end
end
