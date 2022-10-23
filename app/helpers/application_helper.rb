module ApplicationHelper
  def notice_exist(notice)
    if notice.blank? 
      render html: '<h3 class="text-center mt-5"> 予定している通知はありません </h3>'.html_safe
    end
  end
end
