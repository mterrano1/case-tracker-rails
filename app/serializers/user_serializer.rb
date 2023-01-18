class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :role, :open_case_count, :closed_case_count, :unassigned_case_count
  has_many :assigned_cases

  def open_case_count
    object.assigned_cases.joins(:case_assignments).where(cases: { status: "Open" }).size
  end

  def closed_case_count
    object.assigned_cases.joins(:case_assignments).where(cases: { status: "Closed" }).size
  end

  def unassigned_case_count
    object.assigned_cases.joins(:case_assignments).where(cases: { status: "Unassigned" }).size
  end
end
