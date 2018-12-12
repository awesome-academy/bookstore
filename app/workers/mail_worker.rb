class MailWorker
  include Sidekiq::Worker

  def perform(*args)
    @users = User.order_by_dob.select_users
    @users.each do |user|
      if user.dob.strftime("%d/%m/%Y").eql? Date.today.strftime("%d/%m/%Y")
        UserMailer.happy_birthday(user).deliver_now
      end
    end
  end
end
