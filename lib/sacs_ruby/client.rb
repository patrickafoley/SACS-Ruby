module SacsRuby
  # Client class
  class Client
    attr_accessor :access_token, :expires_on

    def initialize
      @credentials = Credentials.new
    end

    def get(params)
      token = params.fetch(:token, nil) || access_token
      RestClient::Request.execute(
        method: :get,
        url: params[:url],
        headers: { 'Authorization' => "Bearer #{token}" }
      ) do |response, request, result, &block|
        case_response(response, request, result, 'get', &block)
      end
    end

    def post(params) # rubocop:disable MethodLength
      token = params.fetch(:token, nil) || access_token
      RestClient::Request.execute(
        method: :post,
        url: params[:url],
        payload: params[:payload],
        headers: {
          'Authorization' => "Bearer #{token}",
          'Content-Type' => 'application/json',
          'Accept-Encoding' => 'gzip'
        }
      ) do |response, request, result, &block|
        case_response(response, request, result, 'post', &block)
      end
    end

    def request_token(auth_key) # rubocop:disable MethodLength
      RestClient::Request.execute(
        method: :post,
        url: SacsRuby.configuration.auth_base_url,
        payload: 'grant_type=client_credentials',
        headers: {
          'Authorization' => "Basic #{auth_key}",
          'Content-Type' => 'application/x-www-form-urlencoded'
        }) do |response, request, result, &block|
          case response.code
          when 200
            response
          when 401
            parsed_response = JSON.load(response)
            fail TokenRequestError, parsed_response
          when 429
            parsed_response = JSON.load(response)
            fail TooManyRequestsError, parsed_response
          else
            response.return!(request, result, &block)
          end
        end
    end

    def access_token
      refresh_if_needed
      @access_token
    end

    def expires_on
      @expires_on || nil
    end

    def fetch_token
      response = request_token(@credentials.encoded)
      parsed_response = JSON.load(response)

      self.access_token = parsed_response['access_token']
      self.expires_on = Time.now.utc + parsed_response['expires_in'].to_i
      self
    end

    private

    def refresh_if_needed
      fetch_token if close_expiration? && !SacsRuby.configuration.shared_token?
    end

    def close_expiration?
      if @access_token
        (Time.now.utc.to_i + 2 * 60) > @expires_on.to_i
      else
        true
      end
    end

    def case_response(response, request, result, method, &block)
      case response.code
      when 200
        response
      when 400
        parsed_response = JSON.load(response)
        fail BadRequestError, parsed_response
      when 401
        parsed_response = JSON.load(response)
        fail AuthorizationError, parsed_response
      when 403
        parsed_response = JSON.load(response)
        fail ClientRequestError, parsed_response
      when 404
        parsed_response = JSON.load(response)
        fail NotFoundError, parsed_response
      when 429
        parsed_response = JSON.load(response)
        fail TooManyRequestsError, parsed_response
      when 500
        if method == 'post'
          parsed_response = JSON.load(response)
          fail JsonSchemaError, parsed_response
        else
          response.return!(request, result, &block)
        end
      else
        response.return!(request, result, &block)
      end
    end
  end
end
