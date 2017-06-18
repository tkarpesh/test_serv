class Activity
  def initialize(user)
    @user = user
  end

  def formatted_data
    data.map { |arr| "#{arr[0]}: #{arr[1..3].join('/')}" }.join("\n")
  end

  private

  def data
    @data = (Topic.pluck(:id, :name) << [nil, Topic::ALL_TOPICS]).map do |arr|
      topic_id, topic_name = arr

      [topic_name, Question.to_ask(@user.id, topic_id).count, Question.can_be_asked(@user.id, topic_id).count,
       Question.by_topic_id(topic_id).count]
    end
  end
end