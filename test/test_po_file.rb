require 'test_helper'

class TestPoFile < Test::Unit::TestCase
  def setup
    @file = PoFile.new("test/fixtures/english.po")
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
    assert_equal(4, @file.find_entry("Uh Oh!").size,@file.find_entry("Uh Oh!").inspect)
  end
  def test_entries
    assert_equal(12, @file.entries.size)
  end
  def test_find_translation_for_multi_line_entry
    msgid = "At Blue Casa we believe in passing savings onto you and we have done the same with the Mexico Unlimited plan."
    translation = "En Blue Casa creemos en pasarle los ahorros a usted y hemos hecho lo mismo con el plan de México Ilimitado."
 #   assert_find_translation(msgid,translation)
    
  end
  def assert_find_translation(msgid,translation)
    assert_equal(translation, @file.find_translation(msgid))
  end
end