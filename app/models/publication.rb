##
# Publication 类，多态成publishable，代表可以发布的东西：Attachment, Idea, Image, Plan
# 用来在 status 里显示。一个 publishable 可以有多个 statuses，比如 创建，修改等
#
class Publication < ApplicationRecord
  include Statusable
  include Relationable
  include Contentable

  PUBLISHABLE_TYPE_NAMES = {idea: "状态", image_array: "图片", attachment: "文件"}.freeze
  REPLIES_TYPE_NAMES = PUBLISHABLE_TYPE_NAMES.freeze

  belongs_to :user
  belongs_to :project

  belongs_to :publishable, polymorphic: true

  # 默认最新的在前
  default_scope { order(created_at: :desc) }


  def name
    PUBLISHABLE_TYPE_NAMES[publishable_type.underscore.to_sym]
  end

  def status_action_type
    "publication"
  end

  def content_type
    publishable_type
  end

  def content
    publishable.content
  end

  # 创建 publishable，并关联创建其 publication
  # 比如：publication = Publication.create_publishable("idea", {content: "okok"}, {user_id:1, project_id: 1})
  def self.create_publishable!(publishable_type, publishable_params={}, publication_params={})
    Publication.transaction do
      publishable = publishable_type.classify.constantize.create!(publishable_params)
      publication = publishable.create_publication!(publication_params)
      return publishable
    end
  end
end
