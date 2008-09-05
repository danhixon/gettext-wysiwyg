# GettextWysiwyg
module GettextWysiwyg
  def gettexty(msgid)
    return msgid if msgid.start_with?("<span")
    "<span class=\"gettext\" onClick=\"javascript:top.document.location.href='/#{GettextLocalize.locale}/message_translations/edit?msgid=#{CGI::escape(msgid)}';\">" + GetText.gettext(msgid) + '</span>' 
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