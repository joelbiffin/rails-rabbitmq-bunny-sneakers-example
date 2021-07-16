class CreatedBidWorker
  include Sneakers::Worker

  from_queue 'created_bid.app_1', routing_key: 'created_bid.#'

  def work(message)
    p "APP_1 #{message}"
    ack!
  end
end
