require 'pp'

load '../data/crm.rb'



#Challenge 1

def Emp_of_companies(data)
  val = data[:companies].reduce([]) do |result, company|
    employees = data[:people].reduce([]) do |emp_array, person|
      person[:employments].each do |job|
        personal_info = {id: person[:id], first_name: person[:first_name], last_name: person[:last_name], title: job[:title]}
        emp_array << personal_info if job[:company_id] == company[:id]
      end
      emp_array
    end
    result << {name: company[:name], employees: employees}
    result
  end

  pp val
end
# uncomment next line to run this challenge solution
# Emp_of_companies(CRM)

#Challenge 2

def Employments(data)
  result = []
  data[:people].each do |person|
    person[:employments].each do |employment|
      full_emp = employment.merge!(person_id: person[:id],
                                  person_first_name: person[:first_name],
                                  person_last_name: person[:last_name],
                                  ) if !employment.empty?
      data[:companies].each do |company|
        employment.merge!(company_name: company[:name])if company[:id] == employment[:company_id]
      end
      result << full_emp
    end
  end

  pp result
end
# uncomment next line to run this challenge solution
# Employments(CRM)

#Challenge 3

def Unemployment(data)
  result = []
  data[:people].each do |person|
    result << {id: person[:id], first_name: person[:first_name], last_name: person[:last_name]} if person[:employments].empty?
  end
  pp result
end
# uncomment next line to run this challenge solution
# Unemployment(CRM)
