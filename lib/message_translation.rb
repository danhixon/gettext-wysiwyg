class MessageTranslation
  attr_accessor :msgid, :translation, :po_file_path, :po_file_output_path
  def initialize(msgid)
    self.msgid = msgid
    self.translation = GetText.gettext(msgid)
    
  end
  def po_file_path
    # default path if nothing set: rails_root/po/en for en_US and rails_root/po/es for es_US
    @po_file_path ||= File.join(application_root,'po',locale_dir, application_name+'.po')
  end
  #default behavior is to use the same file:
  def po_file_output_path
    @po_file_output_path ||= po_file_path
  end
  def update_translation(msgid,new_translation)
#    #puts po_path
#    p = PoFile.new
#    File.open(po_file_path, 'r').each_line do | line |
#      p.add_info(line)
#    end
#
#    p.find_replace(msgid, new_translation)
#
#    # print them all back out
#    temp_po_path = File.open(po_file_output_path, 'w')
#    temp_po_path.puts p
#    temp_po_path.close()
#
  end
  private
  def application_root
   defined?(RAILS_ROOT) ? RAILS_ROOT : "../../../"
    
  end
  def locale_dir
    GettextLocalize.locale.split('_')[0]
  end
  def application_name
    GettextLocalize::app_name
  end
end
