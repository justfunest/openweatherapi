class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  throttle('req/ip', limit: 100, period: 60) do |req|
    req.ip
  end

  self.throttled_response = ->(env) {
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
        429,
        {'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s},
        [{error: "Throttle limit reached. Retry later."}.to_json]
    ]
  }
end