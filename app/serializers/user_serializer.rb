class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :role, :open_case_count, :closed_case_count, :unassigned_case_count
  has_many :assigned_cases

  # Returns the count of open cases assigned to the user.
  def open_case_count
    object.case_assignments.joins(:assigned_case).where(cases: { status: "Open" }, assigned_employee_id: object.id).count
  end

  # Returns the count of closed cases assigned to the user.
  def closed_case_count
    object.case_assignments.joins(:assigned_case).where(cases: { status: "Closed" }, assigned_employee_id: object.id).count
  end

  # Returns the count of unassigned cases assigned to the user.
  def unassigned_case_count
    object.case_assignments.joins(:assigned_case).where(cases: { status: "Unassigned" }, assigned_employee_id: object.id).count
  end
end
