require "open-uri"
require "nokogiri"
require "furiganize/version"

module Furiganize
  class YahooFuriganaService
    def initialize(app_id, grade, sentence)
      @app_id = app_id
      @grade = grade
      @sentence = sentence
    end

    def endpoint
      "http://jlp.yahooapis.jp/FuriganaService/V1/furigana?appid=#{@app_id}&grade=#{@grade}&sentence=#{URI.encode(@sentence)}"
    end

    def fetch
      Nokogiri::XML(open(endpoint))
    end
  end
end
