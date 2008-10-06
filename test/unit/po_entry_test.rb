require File.dirname(__FILE__) + "/../test_helper"

class PoEntryTest < Test::Unit::TestCase
  def setup
    @po_entry = [
      "#: app/views/home/_faq_english.html.erb:55 app/views/home/faq.html.erb:60",
      "#: app/views/home/_faq_english.html.erb:75 app/views/home/faq.html.erb:90",
      "msgid \"\"",
      "\"At Blue Casa we believe in passing savings onto you and we have done the \"",
      "\"same with the Mexico Unlimited plan.\"",
      "msgstr \"\"",
      "\"En Blue Casa creemos en pasarle los ahorros a usted y hemos hecho lo mismo \"",
      "\"con el plan de México Ilimitado.\""]
  end
  def test_msgid
    p = PoEntry.new(@po_entry)
    assert_equal("At Blue Casa we believe in passing savings onto you and we have done the same with the Mexico Unlimited plan.", p.msgid)
  end
  def test_comments
    p = PoEntry.new(@po_entry)
    assert_equal(@po_entry[0..1], p.comments)
  end
  def test_msgstr
    p = PoEntry.new(@po_entry)
    assert_equal("En Blue Casa creemos en pasarle los ahorros a usted y hemos hecho lo mismo con el plan de México Ilimitado.", p.msgstr)
  end
  def test_to_s
    p = PoEntry.new(@po_entry)
    expected = <<DATA
#: app/views/home/_faq_english.html.erb:55 app/views/home/faq.html.erb:60
#: app/views/home/_faq_english.html.erb:75 app/views/home/faq.html.erb:90
msgid "At Blue Casa we believe in passing savings onto you and we have done the same with the Mexico Unlimited plan."
msgstr "En Blue Casa creemos en pasarle los ahorros a usted y hemos hecho lo mismo con el plan de México Ilimitado."
DATA
  assert_equal(expected, p.to_s)
  end
end