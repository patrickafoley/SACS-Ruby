# Ruby Sabre API Client

This library implements [Sabre REST API](https://developer.sabre.com/docs/read/REST_APIs)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sacs_ruby'
```

If you are not using JRuby please consider using [Oj gem](https://github.com/ohler55/oj) for JSON serialization.
To install Oj add this line to your Gemfile:

```ruby
gem 'oj'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sacs_ruby

## Configuration

To get API keys please register on [developer.sabre.com](https://developer.sabre.com/member/register)

Initialize gem with configuration file. If using Rails add it to `config/initializers/sacs_ruby.rb`

```ruby
SacsRuby.configure do |config|
  config.user_id = '' # User ID
  config.group = '' # Group
  config.domain = 'EXT' # Domain
  config.client_secret = '' # Client Secret
  config.environment = 'https://api.test.sabre.com' # Environment
  config.token_strategy = :single # or :shared - see Token paragraph
end
```

#### Use environment variables to store API keys. Never commit it for security reasons.

### Access Token

For single server configuration you can use default token strategy:
```ruby
config.token_strategy = :single
```
Token will be obtained with first request, then stored and auto renewed through life of the server.
Be aware that there is a limit of tokens issued for given API keys.

For multi server configuration (or development when a lot of restarts happen) please
use shared token strategy:
```ruby
config.token_strategy = :shared
```

To request token use:
```ruby
token = SacsRuby.client.fetch_token
token.access_token
token.expires_on
```
Please store it and implement token refresh in to your workflow.

Expired token will raise `SacsRuby::AuthorizationError`.

To use shared token add it as argument, ie:
```ruby
results = SacsRuby::API::BargainFinderMax.get(payload: payload, token: received_access_token)
```

### Environment

When using `https://api.test.sabre.com`, Sabre TEST API will be used.

When you will be ready, you can request access to PROD servers and change to
`https://api.sabre.com`

## Usage

For detailed documentation regarding required params and possible response, please refer to [Sabre REST API documentation](https://developer.sabre.com/docs/read/REST_APIs)

### Basic usage

Each API endpoint listed in documentation can be requested following this pattern:
```ruby
SacsRuby::API::NameOfTheApi.get(*args)
```

Example:

```ruby
results = SacsRuby::API::InstaFlightsSearch.get(origin: 'LAX', destination: 'JFK', departuredate: '2015-12-01', returndate: '2015-12-06') # add `token: token_string` if needed
```

or:

```ruby
ifs = SacsRuby::API::InstaFlightsSearch.new(origin: 'LAX', destination: 'JFK', departuredate: '2015-12-04', returndate: '2015-12-06')

ifs.opts # => {:origin=>"LAX", :destination=>"JFK", :departuredate=>"2015-12-04", :returndate=>"2015-12-06"}

ifs.get # gets data from api

ifs.results # prints response hash
```

If required params are missed during endpoint initialization `SacsRuby::ApiArgumentError` will be raised.

Sometimes additional argument requires another argument to be present.
If it is missing, `SacsRuby::BadRequestError` will be raised with error description provided by the API.


### Advanced usage

Sabre API is very powerful tool. Some of the endpoints cannot accept single arguments,
due to complexity of request.

For those endpoints you need to build JSON payload.

We recomend to create method which will build hash and then converts it to JSON.

Ie:
```ruby
class BargainFinderMax
  def self.build_json(params)
    {
      'OTA_AirLowFareSearchRQ' => {
        'OriginDestinationInformation' => [{
          'DepartureDateTime' => departure_date_helper(params),
          'DestinationLocation' => {
            'LocationCode' => params['destination']
          },
          'OriginLocation' => {
            'LocationCode' => params['origin']
          },
          'RPH' => params['rph']
        }],
        'POS' => {
          'Source' => [{
            'RequestorID' => {
              'CompanyName' => {
                'Code' => params['pos_company_code']
              }, 'ID' => params['pos_id'], 'Type' => params['pos_type']
            }
          }]
        },
        'TPA_Extensions' => {
          'IntelliSellTransaction' => {
            'RequestType' => {
              'Name' => params['request_type']
            }
          }
        },
        'TravelPreferences' => {
          'TPA_Extensions' => {
            'NumTrips' => {
              'Number' => 1
            }
          }
        },
        'TravelerInfoSummary' => {
          'AirTravelerAvail' => [{
            'PassengerTypeQuantity' => [{
              'Code' => params['passenger_code'],
              'Quantity' => params['passenger_qnt'].to_i
            }]
          }]
        }
      }
    }.to_json
  end

  def self.departure_date_helper(params)
    DateTime.strptime(params['departure_date'], '%m/%d/%Y').strftime('%FT%T')
  end
end

payload = BargainFinderMax.build_json(params)
results = SacsRuby::API::BargainFinderMax.get(payload: payload)
```
Pay attention to the format of required arguments.

### Support

- [Stack Overflow](http://stackoverflow.com/questions/tagged/sabre)
- Need to report an issue/improvement? Use the built-in [issues](https://github.com/SabreDevStudio/SACS-Ruby/issues) section.
- [Sabre Dev Studio](https://developer.sabre.com/)

### Disclaimer of Warranty and Limitation of Liability
This software and any compiled programs created using this software are furnished “as is” without warranty of any kind, including but not limited to the implied warranties of merchantability and fitness for a particular purpose. No oral or written information or advice given by Sabre, its agents or employees shall create a warranty or in any way increase the scope of this warranty, and you may not rely on any such information or advice. Sabre does not warrant, guarantee, or make any representations regarding the use, or the results of the use, of this software, compiled programs created using this software, or written materials in terms of correctness, accuracy, reliability, currentness, or otherwise. The entire risk as to the results and performance of this software and any compiled applications created using this software is assumed by you. Neither Sabre nor anyone else who has been involved in the creation, production or delivery of this software shall be liable for any direct, indirect, consequential, or incidental damages (including damages for loss of business profits, business interruption, loss of business information, and the like) arising out of the use of or inability to use such product even if Sabre has been advised of the possibility of such damages.
