crumb :root do
  link "Home", root_path
end

crumb :dashboard do
  link "Dashboard", profile_defined_path
  parent :root
end

crumb :photo_sessions do
  link "Photosessions", client_photo_sessions_path
  parent :dashboard
end

crumb :photo_session do |photo_session|
  link "Photo session #{photo_session.title}", client_photo_session_path(photo_session)
  parent :photo_sessions
end
