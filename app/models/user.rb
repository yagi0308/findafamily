class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ },
                       confirmation: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :birthdate, presence: true
  validates :region_id, presence: true, numericality: { only_integer: true }
  validates :introduction, length: { maximum: 500 }

  has_one_attached :profile_image
  validate :acceptable_image

  private

  def acceptable_image
    return unless profile_image.attached?

    errors.add(:profile_image, 'is too big') unless profile_image.byte_size <= 2.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(profile_image.content_type)

    errors.add(:profile_image, 'must be a JPEG or PNG')
  end
end
