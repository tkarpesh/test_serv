class DdosChecker
  LAST_MESSAGE_TIME_KEY = 'last_message_time'

  def initialize(user_id)
    @now = Time.now.to_f
    @last_message_time = $redis.hget(LAST_MESSAGE_TIME_KEY, user_id).to_f
    $redis.hset(LAST_MESSAGE_TIME_KEY, user_id, @now)
  end

  def allow?
    @last_message_time == 0 || @now - @last_message_time > 1
  end
end
