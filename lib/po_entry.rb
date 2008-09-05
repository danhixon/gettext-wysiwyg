# PoEntry class written by Jake Bartlett
# Originally called "PoBoy" after the delicious Southern sandwich.
# Renamed to "PoEntry" by Dan Hixon because he is a wet blanket that can't read fun code.
class PoEntry

  attr :location, true
  attr :msgid, true
  attr :msgstr, true

  def initialize()
    @location = ""
    @msgid = Array.new
    @msgstr = Array.new    
  end


  def to_s

    line = "\n#{@location}"
    line += "\nmsgid "
    @msgid.each {| msg | line += "#{msg}\n" }
    line += "msgstr "
    @msgstr.each {| msg | line += "#{msg}\n"}

    return line
  end
end
