class Comment
  attr_reader :user_id, :days_ago, :said
  def initialize(user_id, said, days_ago)
    @user_id = user_id
    @days_ago = days_ago
    @said = said
  end

end

