module EmployersHelper
  def favorited(employer, user)
    return true if GradEmplFavorite.where('employer_id = ? AND graduate_id = ?', employer.id, user.id).length > 0
    return false
  end
end
