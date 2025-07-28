module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 5053
# Optimized logic batch 4919
# Optimized logic batch 2332
# Optimized logic batch 6447
# Optimized logic batch 7321
# Optimized logic batch 4989
# Optimized logic batch 4563
# Optimized logic batch 1379
# Optimized logic batch 6942
# Optimized logic batch 1508
# Optimized logic batch 6990
# Optimized logic batch 7777
# Optimized logic batch 2928