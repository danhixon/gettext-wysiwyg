# PoEntry class written by Jake Bartlett
# Originally called "PoBoy" after the delicious Southern sandwich.
# Renamed to "PoEntry" by Dan Hixon because he is a wet blanket that can't read fun code.
class PoEntry

  attr :comments
  attr :msgid
  attr_accessor :msgstr
  
  def initialize(po_entry)
    #puts po_entry.inspect
    @comments, @msgid, @msgstr = [],"",""
    reading_msgid,reading_msgstr = false,false

    po_entry.each do |line|
      @comments << line if line.index("#:")==0
      reading_msgid = true if line.index("msgid")==0
      if line.index("msgstr")==0  
        reading_msgid = false
        reading_msgstr = true 
      end
      
      if reading_msgid
        #remove "msgid" prefix:
        line = line[6..line.length] if line.index("msgid")==0
        #remove the surrounding quotes:
        @msgid += line[1..line.length-2]
      end
      
      if reading_msgstr
        #remove "msgid" prefix:
        line = line[7..line.length] if line.index("msgstr")==0
        #remove the surrounding quotes:
        @msgstr += line[1..line.length-2] || ""
      end
      
    end
    
  end

  
  def to_a
    a = @comments
    a << "msgid \"#{@msgid}\""
    a << "msgstr \"#{@msgstr}\""
    a << "" # blank line at the end of each entry
    a
  end
  def to_s
    to_a.join("\n")
  end
end
