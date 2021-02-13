class ProfileForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :introduction, :user_id
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :prefecture

  JAPANESE_REGEX = /\A[ぁ-んァ-ン一-龥]/
  FULL_WIDTH_REGEX = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :birthday
    validates :user_id

    with_options format: { with: JAPANESE_REGEX } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: FULL_WIDTH_REGEX } do
      validates :first_name_kana
      validates :last_name_kana
    end

    validates :prefecture_id, numericality: { other_than: 1 } 
  end


  def save
    UserAddress.update(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, user_id: user_id)
    UserProfile.update(first_name: first_name, last_name: last_name, first_name_kana: first_name_kana, last_name_kana: last_name_kana, birthday: birthday, introduction: introduction, user_id: user_id)
  end
end