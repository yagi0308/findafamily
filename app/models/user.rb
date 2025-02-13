class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :last_name_kana, presence: { message: 'を入力してください' },
                             format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true, message: 'は全角カタカナで入力してください' }
  validates :first_name_kana, presence: { message: 'を入力してください' },
                              format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true, message: 'は全角カタカナで入力してください' }
  validates :nickname, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: true }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, allow_blank: true }, confirmation: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, allow_blank: true, message: 'は不正な値です' }
  validates :region_id, presence: { message: 'を入力してください' },
                        numericality: { only_integer: true, greater_than: 1, message: 'を入力してください' }
  validates :introduction, length: { maximum: 500 }

  has_one_attached :profile_image
  validate :acceptable_image

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :items, dependent: :destroy

  private

  def acceptable_image
    return unless profile_image.attached?

    errors.add(:profile_image, 'is too big') unless profile_image.byte_size <= 2.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(profile_image.content_type)

    errors.add(:profile_image, 'must be a JPEG or PNG')
  end
end
