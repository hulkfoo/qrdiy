class UserProfile < ApplicationRecord
  belongs_to :user, touch: true

  GENDER_TYPE_NAMES = {secret: '保密', female: '女', male: '男'}.freeze
  GENDER_TYPES = GENDER_TYPE_NAMES.keys.freeze
  enum gender: GENDER_TYPES

  auto_strip_attributes :homepage,
                        delete_whitespaces: true, nullify: true
  auto_strip_attributes :location, :description,
                        squish: true, nullify: true

  validates :homepage, length: { maximum: 100 }, on: :update
  validates :location, length: { maximum: 10 }, on: :update
  validates :gender, inclusion: GENDER_TYPES.map(&:to_s), on: :update
  validates :description, length: { maximum: 2000 }, on: :update

  def gender_name
    GENDER_TYPE_NAMES(gender.to_sym)
  end

end
