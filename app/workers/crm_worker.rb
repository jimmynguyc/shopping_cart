class CrmWorker
  include Sidekiq::Worker

  def perform(params)
    HTTParty.post Settings.crm.api_endpoint + '/customers', body: {
        api_token: Settings.crm.api_token,
        email: params['email'],
        first_name: params['first_name'],
        last_name: params['last_name'],
        address: params['address'],
        zipcode: params['zipcode'],
        country: params['country'],
      }
  end
end
