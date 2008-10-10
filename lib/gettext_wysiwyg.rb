# GettextWysiwyg
module GettextWysiwyg
  def gettexty(msgid)
    return msgid if msgid.start_with?("<span")
    if $gettext_wysiwyg_same_window
      "<span class=\"gettext\" onClick=\"javascript:top.document.location.href='/#{GettextLocalize.locale}/po_entries/edit?msgid=#{CGI::escape(msgid)}';\">" + GetText.gettext(msgid) + '</span>' 
    else
      "<span class=\"gettext\" onClick=\"window.open('/#{GettextLocalize.locale}/po_entries/edit?msgid=#{CGI::escape(msgid)}','mywin','width=400,height=600,scrollbars=1,toolbar=0,resizable=1');\">" + GetText.gettext(msgid) + '</span>' 
    end
  end
  alias :_ :gettexty
  module_function :gettexty, :_
end

module ApplicationHelper
  include GettextWysiwyg
end

module Controller
  include GettextWysiwyg
end

module ActiveRecord
  class Base
    include GettextWysiwyg
  end
end