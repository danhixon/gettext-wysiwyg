# Include hook code here
#uncomment to enable gettexty
if $gettext_wysiwyg && RAILS_ENV=="development"
  puts "** Enabling GetText WYSIWYG!"
  require 'gettext_wysiwyg'
  require 'po_file'
  require 'po_entry'
end