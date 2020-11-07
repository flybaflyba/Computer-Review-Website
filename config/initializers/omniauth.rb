Rails.application.config.middleware.use OmniAuth::Builder do 
    provider :github, Rails.application.credentials.github[:client_id], Rails.application.credentials.github[:client_secret]
end

# we dont want this file in our git hub, coz other people might get our key...
# so we will write our id and secret into a encrypted file by doing:
# EDITOR=vim bin/rails credentials:edit

