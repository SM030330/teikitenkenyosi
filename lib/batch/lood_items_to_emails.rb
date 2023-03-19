class Batch::LoodItemsToEmails
def self.run
    items = Item.includes(:user, :inspection).where("notice_day = :current_day", { current_day: Date.current})
    items.each do |item|
      user = item.user
      inspection =  item.inspection
      DailyNoticeMailer.with(user: user, inspection: inspection, item: item).notice_emails.deliver_now
    end
  end
end