class MessageTranslationsController < ApplicationController
  # do not display messages when gettext_wysiwyg is turned off:
  before_filter :require_gettext_wysiwyg_mode
  
  def edit
    session[:return_to] = request.referer
    @message_translation = MessageTranslation.new(params[:msgid])
  end
  def update
    @message_translation = MessageTranslation.new(params[:msgid])
    @message_translation.translation = params[:message_translation][:translation]
    
    if @message_translation.save
      flash[:notice] = _("Translation updated!")
      system 'rake gettext:makemo'
      redirect_to session[:return_to] || "/"
    else
      flash[:notice] = _("Message not updated!")
      render :action => :edit
    end
    
  end
  def index
    @message_translations = MessageTranslation.find(:all)
  end
  def require_gettext_wysiwyg_mode
    redirect_to '/' unless $gettext_wysiwyg
  end
end