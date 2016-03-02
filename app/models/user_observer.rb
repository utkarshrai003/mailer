class UserObserver < ActiveRecord::Observer
  
  def after_update(user)
    NotifierWorker.perform_async(user.id , user.email_was) if user.email_was != user.email
  end

end
