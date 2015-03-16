module EmployersHelper
  def employer_search_check
    params[:name] = '' if params[:name] == "allLocations"
    params[:industry] = '' if params[:industry] == "allIndustries"
    params[:size] = '' if params[:size] == "allSizes"
    params[:city] = '' if params[:city] == "allCities"
    params[:state] = '' if params[:state] == "allStates"
    params[:zip] = '' if params[:zip] == "allZips"
  end

  def advanced_employer_search_results
    return Employer.where("name LIKE ? AND industry LIKE ? AND size LIKE ? AND city LIKE ? AND state LIKE ? AND zip LIKE ?", "%#{params[:name]}%", "%#{params[:industry]}%" "%#{params[:size]}%", "%#{params[:city]}%", "%#{params[:state]}%", "%#{params[:zip]}%")
  end

  def simple_employer_search_results
    return Employer.where("name LIKE ? OR industry LIKE ? OR size LIKE ? OR city LIKE ? OR state LIKE ? OR zip LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%" "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
  end
end
