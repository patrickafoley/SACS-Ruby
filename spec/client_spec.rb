require 'spec_helper'

describe SacsRuby::Client do
  let(:token_headers) do
    { 'Content-Type' => 'application/x-www-form-urlencoded' }
  end

  let(:token_response) do
    JSON.dump(
      'access_token' => '2iji0j0i9j09',
      'token_type' => 'bearer',
      'expires_in' => 604_800)
  end

  let(:second_response) do
    JSON.dump(
      'access_token' => 'zy9898xx87898',
      'token_type' => 'bearer',
      'expires_in' => 604_800)
  end

  let(:time) { Time.local(2015, 1, 1, 12, 0, 0) }

  subject { described_class.new }

  describe 'requesting token' do
    before do
      stub_request(:post, %r{api.test.sabre.com/v2/auth/token})
        .with(headers: token_headers)
        .to_return(body: token_response).then.to_return(body: second_response)
    end

    describe '#access_token' do
      context 'not expired' do
        it 'returns valid token' do
          expect(subject.access_token).to eq('2iji0j0i9j09')
        end

        it 'stores valid token' do
          expect(subject).to receive(:request_token).once.and_call_original

          2.times { subject.access_token }
        end
      end

      context 'is expired' do
        before { Timecop.freeze(time) }
        let!(:access_token) { subject.access_token }

        it 'refreshes token' do
          Timecop.travel(time + 605_000)
          expect(subject.access_token).to eq('zy9898xx87898')
        end
      end

      context 'is under 2 minutes to expire' do
        before { Timecop.freeze(time) }
        let!(:access_token) { subject.access_token }

        it 'refreshes token' do
          Timecop.travel(time + 604_681)
          expect(subject.access_token).to eq('zy9898xx87898')
        end
      end
    end

    describe '#expires_on' do
      before { Timecop.freeze(time) }

      it 'returns correct expiration date' do
        subject.access_token
        expect(subject.expires_on).to eq(time + 604_800)
      end
    end
  end

  describe '#get' do
    let(:params) do
      {
        url: 'http://api.test.sabre.com',
        token: '2iji0j0i9j09'
      }
    end

    let(:headers) { { 'Authorization' => 'Bearer 2iji0j0i9j09' } }

    context 'request' do
      let(:response) { JSON.dump(a: 1) }

      before do
        stub_request(:get, /api.test.sabre.com/)
          .with(headers: headers)
          .to_return(body: response)
      end

      context 'with token' do

        it 'uses provided token' do
          expect(subject.get(params)).to eq(response)
        end
      end

      context 'without token' do
        let(:params) { { url: 'http://api.test.sabre.com' } }

        before do
          stub_request(:post, %r{api.test.sabre.com/v2/auth/token})
            .with(headers: token_headers)
            .to_return(body: token_response)
        end

        it 'requests for token befor get' do
          expect(subject).to receive(:request_token).and_call_original
          expect(subject.get(params)).to eq(response)
        end
      end
    end

    context 'error handling' do
      context 'bad request' do
        before do
          stub_request(:get, /api.test.sabre.com/)
            .with(headers: headers)
            .to_return(status: 400, body: error_response)
        end

        let(:error_response) do
          JSON.dump(
            status: 'NotProcessed',
            type: 'Validation',
            errorCode: 'ERR.RAF.VALIDATION',
            timeStamp: '2014-11-10T23:07:44.372-06:00',
            message: "Parameter 'departuredate' must be today or a future date"
          )
        end

        it 'raises BadRequestError' do
          expect { subject.get(params) }
            .to raise_error(SacsRuby::BadRequestError, /today or a future date/)
        end
      end

      context 'token is expired' do
        before do
          stub_request(:get, /api.test.sabre.com/)
            .with(headers: headers)
            .to_return(status: 401, body: error_response)
        end

        let(:error_response) do
          JSON.dump(
            status: 'NotProcessed',
            type: 'Validation',
            errorCode: 'ERR.2SG.SEC.INVALID_CREDENTIALS',
            timeStamp: '2014-11-10T23:07:44.372-06:00',
            message: 'Authentication failed due to invalid credentials'
          )
        end

        it 'raises AuthorizationError' do
          expect { subject.get(params) }
            .to raise_error(SacsRuby::AuthorizationError, /invalid credentials/)
        end
      end

      context 'request is missing token' do
        before do
          stub_request(:get, /api.test.sabre.com/)
            .with(headers: headers)
            .to_return(status: 403)
        end

        it 'raises ClientRequestError' do
          expect { subject.get(params) }
            .to raise_error(SacsRuby::ClientRequestError)
        end
      end

      context 'not found' do
        before do
          stub_request(:get, /api.test.sabre.com/)
            .with(headers: headers)
            .to_return(status: 404, body: error_response)
        end

        context 'response contain JSON' do
          let(:error_response) do
            JSON.dump(
              status: 'Complete',
              type: 'Application',
              errorCode: 'WARN.RAF.APPLICATION',
              timeStamp: '2015-11-19T00:28:17+00:00',
              message: 'No results were found'
            )
          end

          it 'raises NotFoundError' do
            expect { subject.get(params) }
              .to raise_error(SacsRuby::NotFoundError, /No results were found/)
          end
        end

        context 'response does not contain any data' do
          let(:error_response) { nil }

          it 'raises NotFoundError' do
            expect { subject.get(params) }
              .to raise_error(SacsRuby::NotFoundError, /404 Not Found/)
          end
        end
      end

      context 'too many requests' do
        before do
          stub_request(:get, /api.test.sabre.com/)
            .with(headers: headers)
            .to_return(status: 429, body: error_response)
        end

        let(:error_response) do
          JSON.dump(
            status: 'NotProcessed',
            type: 'Validation',
            errorCode: 'ERR.2SG.GATEWAY.REQUEST_THROTTLED',
            timeStamp: '2014-11-10T23:07:44.372-06:00',
            message: 'Throttled. Active token count is exceeded.'
          )
        end

        it 'raises TooManyRequestsError' do
          expect { subject.get(params) }
            .to raise_error(SacsRuby::TooManyRequestsError, /count is exceeded/)
        end
      end
    end
  end

  describe '#post' do
    let(:params) do
      {
        url: 'http://api.test.sabre.com',
        payload: JSON.dump(destination: { very: 'far' }),
        token: '2iji0j0i9j09'
      }
    end

    let(:headers) do
      { 'Authorization' => 'Bearer 2iji0j0i9j09',
        'Content-Type' => 'application/json',
        'Accept-Encoding' => 'gzip' }
    end

    let(:response) { JSON.dump(a: 1) }

    before do
      stub_request(:post, /api.test.sabre.com/)
        .with(headers: headers)
        .to_return(body: response)
    end

    context 'request with token' do
      it 'uses provided token' do
        expect(subject.post(params)).to eq(response)
      end
    end

    context 'request without token' do
      let(:response) { JSON.dump(a: 1) }

      let(:params) do
        {
          url: 'http://api.test.sabre.com',
          payload: JSON.dump(destination: { very: 'far' })
        }
      end

      before do
        stub_request(:post, %r{api.test.sabre.com/v2/auth/token})
          .with(headers: token_headers)
          .to_return(body: token_response)
      end

      it 'requests for token befor post' do
        expect(subject).to receive(:request_token).and_call_original
        expect(subject.post(params)).to eq(response)
      end
    end
  end

  describe '#request_token' do
    let(:auth_key) { 'ZEdWNGRBPT06ZEdWNGRBPT0=' }
    let(:url) { %r{dGV4dA%3D%3D:dGV4dA%3D%3D@api.test.sabre.com/v2/auth/token} }

    before do
      stub_request(:post, url)
        .with(headers: token_headers,
              body: { 'grant_type' => 'client_credentials' })
        .to_return(body: token_response)
    end

    it 'returns valid response' do
      expect(subject.request_token(auth_key)).to eq(token_response)
    end

    context 'error handling' do
      context 'unauthorized' do
        let(:error_response) do
          JSON.dump(
            'error' => 'invalid_client',
            'error_description' => 'Credentials are missing or'\
            'the syntax is not correct'
          )
        end
        before do
          stub_request(:post, url)
            .with(headers: token_headers,
                  body: { 'grant_type' => 'client_credentials' })
            .to_return(status: 401, body: error_response)
        end

        it 'raises TokenRequestError' do
          expect { subject.request_token(auth_key) }
            .to raise_error(SacsRuby::TokenRequestError, /Credentials are missing/)
        end
      end
    end
  end
end
