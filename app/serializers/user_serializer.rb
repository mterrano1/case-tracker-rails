class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :role, :open_case_count, :closed_case_count, :unassigned_case_count
  has_many :assigned_cases

  def open_case_count
    object.case_assignments.joins(:assigned_case).where(cases: { status: "Open" }, assigned_employee_id: object.id).count
  end

  def closed_case_count
    object.case_assignments.joins(:assigned_case).where(cases: { status: "Closed" }, assigned_employee_id: object.id).count
  end

  def unassigned_case_count
    object.case_assignments.joins(:assigned_case).where(cases: { status: "Unassigned" }, assigned_employee_id: object.id).count
  end
end
