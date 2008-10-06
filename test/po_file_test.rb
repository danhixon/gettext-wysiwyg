require 'test_helper'

class TestPoFile < Test::Unit::TestCase
  def setup
    file_name = File.dirname(__FILE__) + "/fixtures/english.po"
    @file = PoFile.new(file_name)
  end
  def test_line_count
    assert_not_nil(@file)
    assert_equal(73, @file.line_count)
  end
  def test_entry_count
    assert_equal(12, @file.entry_count)
  end
  def test_find_translation
    assert_find_translation("Uh Oh!","Oh No!")   
  end
  def test_find_entry
    assert_equal("Uh Oh!", @file.find_entry("Uh Oh!").msgid)
  end
  def test_entries
    assert_equal(12, @file.entries.size)
  end
  def test_find_translation_for_multi_line_entry
    msgid = "At Blue Casa we believe in passing savings onto you and we have done the same with the Mexico Unlimited plan."
    translation = "En Blue Casa creemos en pasarle los ahorros a usted y hemos hecho lo mismo con el plan de México Ilimitado."
    assert_find_translation(msgid,translation)
    
  end
  def assert_find_translation(msgid,translation)
    assert_equal(translation, @file.find_translation(msgid))
  end
  def test_change
    @file.update_translation("Uh Oh!","Whoopsie!")
    assert_find_translation("Uh Oh!","Whoopsie!")   
  end
  def test_file_lines
    assert_equal(21+12*4, @file.file_lines.size)
  end
  def test_save
    #save file with changes as english.po.test:
    file_name = File.dirname(__FILE__) + "/fixtures/english.po.test"
    @file.update_translation("Uh Oh!","Whoopsie!")
    @file.save(file_name)
    assert File.exists?(file_name)
    
    #read in new file:
    new_file = PoFile.new(file_name)
    #@file.file_lines.each {|l| puts l}
    assert_equal(@file.entry_count, new_file.entry_count)
    #clean up
    File.delete(file_name)
  end
end