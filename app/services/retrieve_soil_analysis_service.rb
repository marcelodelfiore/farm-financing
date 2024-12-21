# frozen_string_literal: true

module RetrieveSoilAnalysisService
  API_BASE_URL = "http://localhost:3000"

  class << self
    def call(data:)
      response = Faraday.new(url: API_BASE_URL) do |conn|
        conn.request :url_encoded
        conn.response :json
        conn.adapter Faraday.default_adapter
      end.post('/fertilization_recommendations') do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.body = request_body(data).to_json
      end

      handle_response(response)
    rescue Faraday::Error => e
      Rails.logger.error "API Error: #{e.message}"
      { error: "Failed to connect to API" }
    end

    private

    def request_body(params)
      {
      fertilization_recommendation: {
          analysis_id: params[:analysis_id],
          culture: params[:culture],
          ve: 75.0,
          prnt: 99.0,
          plantio_direto: params[:no_till] == '1' ? "sim" : "não",
          produtividade_desejada: params[:expected_productivity].to_f,
          fonte_nutrientes_npk: params[:npk_sources]
        }
      }
    end

    def handle_response(response)
      if response.success?
        response.body
      else
        { error: "API Error: #{response.status} - #{response.body}" }
      end
    end
  end
end
