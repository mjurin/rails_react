class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def google_oauth2
  #      # You need to implement the method below in your model (e.g. app/models/user.rb)
  #      @user = User.from_omniauth(request.env["omniauth.auth"])

  #      if @user.persisted?
  #        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
  #        sign_in_and_redirect @user, :event => :authentication
  #      else
  #        session["devise.google_data"] = request.env["omniauth.auth"]
  #        redirect_to new_user_registration_url
  #      end
  #  end

  def slack
    #raise request.env["omniauth.auth"].to_json
    # returns: {"provider":"slack","uid":"U0280GS4J","info":{"nickname":"knagode","team":"Mice3","user":"knagode","team_id":"T0280GS4G","user_id":"U0280GS4J","name":"","email":"klemen.nagode@gmail.com","first_name":null,"last_name":null,"description":null,"image_24":"https://secure.gravatar.com/avatar/331994d09f3139c73f1ac29e5a65d91e.jpg?s=24\u0026d=https%3A%2F%2Fslack.global.ssl.fastly.net%2F66f9%2Fimg%2Favatars%2Fava_0022-24.png","image_48":"https://secure.gravatar.com/avatar/331994d09f3139c73f1ac29e5a65d91e.jpg?s=48\u0026d=https%3A%2F%2Fslack.global.ssl.fastly.net%2F66f9%2Fimg%2Favatars%2Fava_0022-48.png","image":"https://secure.gravatar.com/avatar/331994d09f3139c73f1ac29e5a65d91e.jpg?s=192\u0026d=https%3A%2F%2Fslack.global.ssl.fastly.net%2F7fa9%2Fimg%2Favatars%2Fava_0022-192.png","team_domain":"mice3","is_admin":true,"is_owner":true,"time_zone":"Europe/Amsterdam"},"credentials":{"token":"xoxp-2272570152-2272570154-19586448769-892f214e94","expires":false},"extra":{"raw_info":{"ok":true,"url":"https://mice3.slack.com/","team":"Mice3","user":"knagode","team_id":"T0280GS4G","user_id":"U0280GS4J"},"web_hook_info":{},"bot_info":{},"user_info":{"ok":true,"user":{"id":"U0280GS4J","team_id":"T0280GS4G","name":"knagode","deleted":false,"status":null,"color":"9f69e7","real_name":"","tz":"Europe/Amsterdam","tz_label":"Central European Time","tz_offset":3600,"profile":{"real_name":"","real_name_normalized":"","email":"klemen.nagode@gmail.com","image_24":"https://secure.gravatar.com/avatar/331994d09f3139c73f1ac29e5a65d91e.jpg?s=24\u0026d=https%3A%2F%2Fslack.global.ssl.fastly.net%2F66f9%2Fimg%2Favatars%2Fava_0022-24.png","image_32":"https://secure.gravatar.com/avatar/331994d09f3139c73f1ac29e5a65d91e.jpg?s=32\u0026d=https%3A%2F%2Fslack.global.ssl.fastly.net%2F66f9%2Fimg%2Favatars%2Fava_0022-32.png","image_48":"https://secure.gravatar.com/avatar/331994d09f3139c73f1ac29e5a65d91e.jpg?s=48\u0026d=https%3A%2F%2Fslack.global.ssl.fastly.net%2F66f9%2Fimg%2Favatars%2Fava_0022-48.png","image_72":"https://secure.gravatar.com/avatar/331994d09f3139c73f1ac29e5a65d91e.jpg?s=72\u0026d=https%3A%2F%2Fslack.global.ssl.fastly.net%2F66f9%2Fimg%2Favatars%2Fava_0022-72.png","image_192":"https://secure.gravatar.com/avatar/331994d09f3139c73f1ac29e5a65d91e.jpg?s=192\u0026d=https%3A%2F%2Fslack.global.ssl.fastly.net%2F7fa9%2Fimg%2Favatars%2Fava_0022-192.png","image_512":"https://secure.gravatar.com/avatar/331994d09f3139c73f1ac29e5a65d91e.jpg?s=512\u0026d=https%3A%2F%2Fslack.global.ssl.fastly.net%2F7fa9%2Fimg%2Favatars%2Fava_0022-512.png"},"is_admin":true,"is_owner":true,"is_primary_owner":true,"is_restricted":false,"is_ultra_restricted":false,"is_bot":false,"has_2fa":false}},"team_info":{"ok":true,"team":{"id":"T0280GS4G","name":"Mice3","domain":"mice3","email_domain":"mice3.it","icon":{"image_34":"https://slack.global.ssl.fastly.net/0180/img/avatars-teams/ava_0020-34.png","image_44":"https://slack.global.ssl.fastly.net/66f9/img/avatars-teams/ava_0020-44.png","image_68":"https://slack.global.ssl.fastly.net/66f9/img/avatars-teams/ava_0020-68.png","image_88":"https://slack.global.ssl.fastly.net/66f9/img/avatars-teams/ava_0020-88.png","image_102":"https://slack.global.ssl.fastly.net/66f9/img/avatars-teams/ava_0020-102.png","image_132":"https://slack.global.ssl.fastly.net/66f9/img/avatars-teams/ava_0020-132.png","image_default":true}}}}}

    # probably we should save team_id & name somewhere (e.g. user.current_team_id, user.current_team_name. Do we need more?)


    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to root_path

    # if @user.persisted?
    #   flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Slack"
    #   sign_in_and_redirect @user, :event => :authentication
    # else
    #   session["devise.google_data"] = request.env["omniauth.auth"]
    #   redirect_to new_user_registration_url
    # end
  end
end
