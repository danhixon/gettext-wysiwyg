# Include hook code here
#uncomment to enable gettexty
if $gettext_wysiwyg && RAILS_ENV=="development"
  puts "** Enabling GetText WYSIWYG!"
  require 'gettext_wysiwyg'
  require 'message_translation'
end