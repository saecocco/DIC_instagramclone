class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "s-yano@clickclover.net", subject: "投稿完了メール"
  end
end
