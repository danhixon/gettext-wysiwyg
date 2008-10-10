class PoEntriesController < ApplicationController
  # do not display messages when gettext_wysiwyg is turned off:
  before_filter :require_gettext_wysiwyg_mode
  
  def edit
    po = PoFile.new
    @po_entry = po.find_entry(params[:msgid])
  end
  def update
    po = PoFile.new
    if po.update_translation(params[:msgid],params[:po_entry][:msgstr])
      po.write_file
      system 'rake gettext:makemo'
      flash[:notice] = _("Translation updated!")
      redirect_to "/#{params[:lang]}/po_entries/show?msgid=#{CGI::escape(params[:msgid])}"
      #TODO: it might make more sense to redirect to a show action... 
    else
      flash[:notice] = "Message '#{params[:msgid]}' not updated!<br />Message Not found.  Try running 'rake gettext:updatepo'"
      render :action => :edit
    end
  
  
  end
  def show
    #nothing to do...
  end
  def index
    po = PoFile.new
    @po_entries = po.entries
  end
  def require_gettext_wysiwyg_mode
    redirect_to '/' unless $gettext_wysiwyg
  end
end
