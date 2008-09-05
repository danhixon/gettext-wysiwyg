# PoFile class written by Jake Bartlett
# Originally called "PoBoyFile" in honor of the delicious Southern sandwich.
# Renamed to "PoFile" by Dan Hixon because he is a wet blanket that can't read fun code.

class PoFile

  def initialize()
    @all_po_boys = Array.new
    @p = PoEntry.new
    @info_to_add = nil
  end
  
  def add_info(line)
    line.chomp!

    # blank line.  make a new PoBoy
    if line.strip.length == 0
      # add the PoEntry if it actually contains info
      if @p.location.length > 0
        @all_po_boys << @p
      end

      @p = PoEntry.new

      # since it's a blank line, return.  nothing else to do.
      return
    end

    # make an array of words
    word = line.split

    # check the first word to decide where to put it
    # this sets the state
    case word[0]
      when "#:"
        @info_to_add = :location
      when "#"
        @info_to_add = :location
      when "msgid"
        @info_to_add = :msgid
        # remove msgid from the front of the line
        line[0.."msgid".length] = ""
      when "msgstr"
        @info_to_add = :msgstr
        # remove msgstr from the front of the line
        line[0.."msgstr".length] = ""
    end


    # this puts the line in the right place depending on what state we're in
    case @info_to_add
      when :location
        @p.location = line
      when :msgid
        @p.msgid << line
      when :msgstr
        @p.msgstr << line
    end
  end

  def find_replace(msgid, new_msg)
    # add quotes to it to make it look like the other msgids
    msgid = "\"#{msgid}\""
    # add quotes to it to make it look like the other msgstrs
    new_msg = "\"#{new_msg}\""
    @all_po_boys.each do | p |
      p.msgid.each do | id |
        # find a match
        if id == msgid
          # replace the info
          p.msgstr.clear
          p.msgstr << new_msg
        end
      end
    end
  end

  def to_s
    line = ""
    @all_po_boys.each do | p |
      line += p.to_s
    end

    return line
  end
end