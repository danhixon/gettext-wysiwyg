class GettextWysiwygGenerator < Rails::Generator::NamedBase
  def manifest
    controller_name = 'po_entries'
    recorded_session = record do |m|
      # m.directory "lib"
      m.template 'po_entries_controller.rb',"app/controllers/#{controller_name}_controller.rb"
      m.directory "app/views/#{controller_name}/"
      m.template 'index.html.erb',"app/views/#{controller_name}/index.html.erb"
      m.template 'edit.html.erb',"app/views/#{controller_name}/edit.html.erb"
      m.template 'show.html.erb',"app/views/#{controller_name}/show.html.erb"
      m.template 'layout.html.erb',"app/views/layouts/#{controller_name}.html.erb"
    end
    
    recorded_session
  end
end
