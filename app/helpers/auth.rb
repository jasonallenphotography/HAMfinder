def current_user
 current_user ||= User.find_by_id(session[:id])
end

def logged_in?
  current_user != nil
end

def redirect_unless_logged_in
  redirect '/login' unless logged_in?
end

def redirect_if_already_logged_in
  redirect '/' if logged_in?
end

def redirect_unless_current_user_owns(thing)
  redirect '/' unless logged_in? && current_user.id == thing.author_id
end

def redirect_unless_editing_or_deleting_own(profile_owner)
  redirect "/users/#{profile_owner}" unless logged_in? && current_user.id == profile_owner
end
