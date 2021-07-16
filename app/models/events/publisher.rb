module Events
  class Publisher
    def self.publish(key:, payload: {})
      new(key, payload).publish
    end

    def initialize(key, payload)
      @key = key
      @payload = payload
    end

    def publish
      exchange = BunnyConnectionManager.instance.exchange
      exchange.publish(payload, routing_key: key)
    end

    private

    def key
      "#{@key}.#"
    end

    def payload
      @payload.merge(key: @key).to_json
    end
  end

  class BunnyConnectionManager
    include Singleton

    attr_accessor :active_connection, :active_channel

    def exchange
      channel.topic(shared_exchange, default_exchange_options)
    end

    def default_exchange_options
      { durable: true }
    end

    def shared_exchange
      @shared_exchange ||= "app_1_app_2_shared_exchange"
    end

    def establish_connection
      @active_connection = Bunny.new
      active_connection.start
      @active_channel = active_connection.create_channel

      @active_connection
    end

    def connection
      return active_connection if connected?
      establish_connection

      active_connection
    end

    def channel
      return active_channel if connected? && active_channel&.open?
      establish_connection

      active_channel
    end

    def connected?
      active_connection&.connected?
    end
  end
end
