require 'test_helper'

class TestMessageTranslation < Test::Unit::TestCase
  # Replace this with your real tests.
  def test_file_path
    m = MessageTranslation.new("msgid")
    m.po_file_path = "/home/rails/test"
    assert_equal("/home/rails/test",m.po_file_path)
  end
  def test_default_file_path
    m = MessageTranslation.new("msgid")
    m.expects(:locale_dir).returns("en")
    m.expects(:application_name).returns("SuperSluth")
    assert_equal("../../../po/en/SuperSluth.po", m.po_file_path)
  end
  def test_entry_count
    m = MessageTranslation.new("Uh Oh!")
    m.po_file_path = "fixtures/english.po"
    m.po_file_output_path = m.po_file_path + ".tmp"
    assert File.exists?(m.po_file_path)
  end
  
end
