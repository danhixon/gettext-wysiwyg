class MessageTranslation
  attr_accessor :msgid, :translation
  def initialize(msgid)
    self.msgid = msgid
    self.translation = GetText.gettext(msgid)
  end
  def self.po_file_path
    File.join(application_root,'po',locale_dir, application_name+'.po')
  end
  def save
    p = PoFile.new(MessageTranslation.po_file_path)
    p.update_translation(self.msgid,self.translation)
    p.save
  end
  
  def self.find(which)
    p = PoFile.new(po_file_path)
    if which==:all
      p.entries
    else
      p.find_entry(which)
    end
    
  end
  
  
  def self.application_root
   defined?(RAILS_ROOT) ? RAILS_ROOT : "../../../"
    
  end
  def self.locale_dir
    GettextLocalize.locale.split('_')[0]
  end
  def self.application_name
    GettextLocalize::app_name
  end
end
