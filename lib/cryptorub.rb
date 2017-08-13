require "cryptorub/version"
require 'json'
require 'trollop'
require 'ncypher'
require 'colorize'
require 'awesome_print'
require 'coinbase/wallet'

module Cryptorub
  class Cryptorub
    def initialize
      @client = Coinbase::Wallet::Client.new(api_key: Ncypher::Ncypher.decrypt('BUBapMiEqj+AbFcArUQM/+IpR1bN0iVLUK/fDXC3Qcb2VBJpXuLg93B4e5vT19cyWd8NTSMmAv0='),
      api_secret: Ncypher::Ncypher.decrypt('bGhqvwShcBIm8RASyke8ShqFwswUeYc/r1czUMLAQS0TufAytW3F1Stxbilde19bHA+HFNqRbAQBG2n8e144klnFolkM13H1'))
      opts = Trollop::options do
        opt :intervall, "intervall of time", type: :integer, default: 60
        opt :currency, "currency desired", type: :string, default: 'ETH'
        opt :sma, "simple moving average", type: :integer, default: 20
        opt :charts, "Display charts"
      end
      charts(opts[:intervall], opts[:currency], opts[:sma]) if opts[:charts]
    end

    def charts(intervall, currency, sma)
      my_hash = @client.buy_price
      old_value = my_hash['amount']
      loop do
        my_hash = @client.buy_price
        unless old_value == my_hash['amount']
          puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} #{currency}-USD: #{my_hash['amount'].send(old_value < my_hash['amount']? :green : :red)}"
        end
        old_value = my_hash['amount']
        sleep intervall
      end
    end
  end
end
