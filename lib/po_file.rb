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
    File.open(po_file_path, 'r').each_line do |line|
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
    entry ? entry.msgstr : nil
  end
  def update_translation(msgid, new_msgstr)
    entry = find_entry(msgid)
    if entry
      entry.msgstr = new_msgstr
    end
  end
  def find_entry(msgid)
    entries.each do |e|
      return e if e.msgid.eql? msgid
    end
    return nil
  end
  def save(file_path=nil)
    file_path ||= self.po_file_path
    lines = file_lines
    File.open(file_path,'w') do  |f|
      lines.each do |line|
        f.puts(line)
      end
    end
  end
  def headers
    @all_lines[0...@blank_indicies[0]]
  end
  def file_lines
    return @output_lines unless @output_lines.nil?
    @output_lines = headers
    entries.each do |e|
      e.to_a.each do |line|
        @output_lines << line
      end
    end
    #removes the final blank line:
    @output_lines[0...@output_lines.size-1]
  end
  protected 
  def get_entries
    e = []
    @blank_indicies.each_with_index do |line_number,i|
      e << PoEntry.new(@all_lines[line_number...@blank_indicies[i+1]]) unless @blank_indicies[i+1].nil?
    end
    e
  end


end