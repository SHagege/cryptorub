require "cryptorub/version"
require 'json'
require 'trollop'
require 'awesome_print'
require 'ncypher'
require 'colorize'
require 'moving_average'
require 'coinbase/wallet'

module Cryptorub
  class Cryptorub
    def initialize
      @array = []
      @client = Coinbase::Wallet::Client.new(api_key: Ncypher::Ncypher.decrypt('BUBapMiEqj+AbFcArUQM/+IpR1bN0iVLUK/fDXC3Qcb2VBJpXuLg93B4e5vT19cyWd8NTSMmAv0='),
      api_secret: Ncypher::Ncypher.decrypt('bGhqvwShcBIm8RASyke8ShqFwswUeYc/r1czUMLAQS0TufAytW3F1Stxbilde19bHA+HFNqRbAQBG2n8e144klnFolkM13H1'))
      opts = Trollop::options do
        opt :intervall, "intervall of time", type: :integer, default: 60
        opt :currency, "currency desired", type: :string, default: 'ETH'
        opt :sma, "simple moving average", type: :integer, default: 100
        opt :ema, "exponential moving average", type: :integer, default: 25
        opt :charts, "Display charts"
      end
      charts(opts[:intervall], opts[:currency], opts[:sma], opts[:ema]) if opts[:charts]
    end

    def charts(intervall, currency, sma, ema)
      my_hash = @client.buy_price
      old_value = my_hash['amount']
      loop do
        my_hash = @client.buy_price
        unless old_value == my_hash['amount']
          puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} #{currency}-USD: #{my_hash['amount'].send(old_value < my_hash['amount']? :green : :red)}"
          @array << my_hash['amount'].to_f
          algorythm(sma, ema)
        end
        old_value = my_hash['amount']
        sleep intervall
      end
    end

    def algorythm(sma_weight, ema_weight)
      sma_value = @array.last(sma_weight).sma
      ema_value = @array.last(ema_weight).ema
      if sma_value > ema_value
        puts "#{sma_value} - #{ema_value} Bearish. SALES, time to buy"
      else
        puts "#{sma_value} - #{ema_value} Bullish. Either sell or hold"
      end
    end
  end
end
