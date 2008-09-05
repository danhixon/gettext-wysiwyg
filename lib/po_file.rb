# PoFile class written by Jake Bartlett
# Originally called "PoBoyFile" in honor of the delicious Southern sandwich.
# Renamed to "PoFile" by Dan Hixon because he is a wet blanket that can't read fun code.

class PoFile
  attr_accessor :po_file_path
  def initialize(file_path)
    self.po_file_path = file_path
    read_file
  end
  def read_file
    @all_lines = []
    @blank_indicies = []
    File.open(po_file_path, 'r').each_line do | line |
      line.chomp!
      @all_lines << line
      @blank_indicies << @all_lines.size if line.empty?
    end
    @blank_indicies << @all_lines.size
  end
  def line_count
    @all_lines.size
  end
  def entry_count
    entries.size
  end
  def entries
    @entries ||= get_entries
  end
  def find_translation(msgid)
    entry = find_entry(msgid)
    translation=[]
    entry.each do |line|
      if line.split[0]=="msgstr"
        contents = line.gsub("msgstr","").strip
        #this removes the surrounding quotes
        translation << contents[1...(contents.length-1)]
      end
    end
    return translation[0]
  end
  def find_replace(msgid, new_msg)
    #check all msgids by skipping through the indicies
  end
  def find_entry(msgid)
    entries.each do |e|
      e.each do |line|
        #puts line
        #This needs to get better - currently it will only find a msgid that exists on a single line.
        return e if line.index("msgid") && line.index(msgid)
      end
    end
    return nil
  end
  def extract_msgid(entry)
    
  end
  protected 
  def get_entries
    entries = []
    @blank_indicies.each_with_index do |line_number,i|
      #puts "#{line_number}, #{@blank_indicies[i+1]}"
      entries << @all_lines[line_number...@blank_indicies[i+1]] unless @blank_indicies[i+1].nil?
      #puts entries[entries.size-1].inspect
    end
    entries
  end


end