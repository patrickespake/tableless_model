class TablelessModelGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.template "model.rb.erb", "app/models/#{file_name}.rb"
    end
  end
end