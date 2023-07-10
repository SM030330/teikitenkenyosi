class DailyNoticeMailer < ApplicationMailer
  def notice_emails
    @root_url = ENV['SMTP_HOST']
    @user = params[:user]
    @inspection = params[:inspection]
    @item = params[:item]
    mail(to: @user.email, subject: '定期点検Checkerより近日に予定している点検をお知らせいたします')
  end
end
