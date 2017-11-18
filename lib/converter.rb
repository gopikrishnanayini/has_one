class Converter
  require 'net/http'

  def initialize(amount, source = "USD", target = "GBP")
    @amount = amount
    @target = target
    @source = source
  end

  def convert!
    body = get_exchange_rate_from_api
    rate = extract_exchange_rate(body)
    (@amount * rate).round(2)
  end

  private
  def extract_exchange_rate(body)
    JSON.parse(body)["rates"][@target]
  end

  def get_exchange_rate_from_api
    url = URI(api_url)
    Net::HTTP.get(url)
  end

  def api_url
    "http://api.fixer.io/latest?symbols=#{@target}&base=#{@source}"
  end
end