class CaseSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :allegation_type, :allegation, :department, :status, :resolution, :datetime, :days_ago 

  def datetime
    created_at = self.object.created_at
    datetime = created_at.strftime("%B %d, %Y %I:%M %p")
  end

  def days_ago
    object.created_at ? "#{distance_of_time_in_words(Time.now, object.created_at)} ago" : nil
  end
end