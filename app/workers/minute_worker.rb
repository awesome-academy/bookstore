class MinuteWorker
  include Sidekiq::Worker

  def perform(user)
    UserMailer.happy_birthday(user).deliver_now
  end

  private

  def send_email_when_end_minute user
    UserMailer.happy_birthday(user).deliver_now
  end
end
