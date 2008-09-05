class MessageTranslationsController < ApplicationController
  def edit
    @message_translation = MessageTranslation.new
    @message_translation.translation = MessageTranslation.gettext(params[:id])
    @message_translation.id = params[:id]
  end
  def update
    @message_translation = MessageTranslation.new(params[:get_text_message])
    flash[:notice] = "Hey!"
    render :action => :edit
  end
  def index
    @message_translations = MessageTranslation.find(:all)
  end
end