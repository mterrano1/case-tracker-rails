class CaseSerializer < ActiveModel::Serializer
  attributes :id, :allegation_type, :allegation, :department, :status, :resolution, :datetime 

  def datetime
    created_at = self.object.created_at
    datetime = created_at.strftime("%B %d, %Y %I:%M %p")
  end
end