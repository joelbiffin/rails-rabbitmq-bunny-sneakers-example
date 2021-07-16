class BidsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Events::Publisher.publish(
      key: "created_bid",
      payload: { hello: "world" },
    )
  end
end
