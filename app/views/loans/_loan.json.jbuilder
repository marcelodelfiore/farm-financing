json.extract! loan, :id, :client_id, :analysis_id, :status, :culture, :no_till, :expected_productivity, :npk_sources, :created_at, :updated_at
json.url loan_url(loan, format: :json)
