class GettextWysiwygGenerator < Rails::Generator::NamedBase
  def manifest
    controller_name = 'message_translations'
    recorded_session = record do |m|
      # m.directory "lib"
      m.template 'message_translations_controller.rb',"app/controllers/#{controller_name}_controller.rb"
      m.directory "app/views/#{controller_name}/"
      m.template 'index.html.erb',"app/views/#{controller_name}/index.html.erb"
      m.template 'edit.html.erb',"app/views/#{controller_name}/edit.html.erb"
    
    end
    
    recorded_session
  end
end
