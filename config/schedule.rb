# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = ENV['RAILS_ENV'] || :development
# https://www.cotegg.com/blog/?p=1606
# docker上で実行する際の環境変数の再定義
ENV.each { |k, v| env(k, v) } 

set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"

# 毎日午前0時に実行
every 1.days, at: '0:00 am' do
  runner "Batch::LoodItemsToEmails.run"
end
