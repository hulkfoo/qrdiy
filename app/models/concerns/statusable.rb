##
# 可以发布状态。
# 目前有： Project, Relation, Publication, Comment
module Statusable
  extend ActiveSupport::Concern

  included do
    has_many :statuses, as: :statusable, dependent: :destroy
    after_create :create_status
  end

  def status_action_type
    raise NotImplementedError, "Including classes must implement a status_action_type() method"
  end

  def create_status
    # FIXME 不显示 trix create attachment
    # message 也没有 project
    if user_id
      status = statuses.new(user_id: user_id,
        action_type: status_action_type)  # 判断是否定义了 action_type 方法
      status.project = try(:project)
      status.save!
    end
  end
end
