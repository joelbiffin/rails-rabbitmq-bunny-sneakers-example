Sneakers.configure(
  heartbeat: 30,
  amqp: 'amqp://guest:guest@localhost:5672',
  vhost: '/',
  exchange: 'app_1_app_2_shared_exchange',
  exchange_type: :topic,
)
