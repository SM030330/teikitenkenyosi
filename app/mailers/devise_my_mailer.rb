class DeviseMyMailer < Devise::Mailer
  # これでは動かない
  # https://github.com/heartcombo/devise/issues/4842
  # default template_path: 'users/mailer'
  # https://thinkami.hatenablog.com/entry/2021/06/15/233217

  def headers_for(action, opts)
    @root_url = ENV['SMTP_HOST']
    super.merge!(template_path: 'main/users/mailer')
  end
end