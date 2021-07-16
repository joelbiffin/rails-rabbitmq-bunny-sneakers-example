# Example RabbitMQ PubSub Implementation using Bunny & Sneakers

Install [RabbitMQ via homebrew](https://www.rabbitmq.com/install-homebrew.html) (can use a [Docker image](https://hub.docker.com/_/rabbitmq) too if you'd like).


Bundle the gems:

```
bundle
```

Install foreman:

```
gem install foreman
```

Run your RabbitMQ service:

```
brew services start rabbitmq
```

Run the server and sneakers worker via foreman:

```
foreman start
```

Send a POST request to the `/bids` endpoint and inspect your sneakers logs:
```bash
curl -X POST localhost:5000/bids
```
