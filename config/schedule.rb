job_type :sidekiq, "cd :path && :environment_variable=:environment bundle exec sidekiq-client push :task :output"

every 1.day, :roles => [:app] do
  sidekiq "MailWorker"
end
