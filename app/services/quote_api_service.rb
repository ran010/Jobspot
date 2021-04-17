class QuoteApiService
  def self.call
    body = nil
    begin
      response = Faraday.get "http://quotes.stormconsultancy.co.uk/random.json"
      if response.status == 200
        body = JSON.parse(response.body)
      end
    rescue => exception
      puts "quote api error"
    end
    body
  end
end
