require File.expand_path(File.dirname(__FILE__) + "/lib/insert_commands.rb")
class FormBuilderGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      # Models
      m.directory "app/models"
      %w(form form_field form_value submission submission_notifier).each do |template|
        m.file "#{template}.rb", "app/models/#{template}.rb"
      end
      
      # Controllers
      m.directory "app/controllers"
      %w(forms submissions).each do |controller|
        m.file "#{controller}_controller.rb", "app/controllers/#{controller}_controller.rb"
      end
      
      # Helpers
      m.directory "app/helpers"
      %w(forms submissions).each do |helper|
        m.file "#{helper}_helper.rb", "app/helpers/#{helper}_helper.rb"
      end
      
      # Views
      m.directory "app/views"
      %w(forms submission_notifier submissions).each do |folder|
        m.directory "app/views/#{folder}"
      end
      
      %w(index show edit new _form _form_field).each do |view|
        m.file "views/forms/#{view}.html.erb", "app/views/forms/#{view}.html.erb"
      end
      
      m.file "views/submission_notifier/form_submission.text.plain.erb", "app/views/submission_notifier/form_submission.text.plain.erb"
      m.file "views/submission_notifier/form_submission.text.html.erb", "app/views/submission_notifier/form_submission.text.html.erb"
      
      %w(index show edit new _form _form_value).each do |view|
        m.file "views/submissions/#{view}.html.erb", "app/views/submissions/#{view}.html.erb"
      end
      
      # Migrations
      %w(forms form_fields form_values submissions).each do |migration|
        m.migration_template "#{migration}_migration.rb", "db/migrate", :migration_file_name => "create_#{migration}"
      end
      
      m.insert_custom_route "map.resources :forms, :member => { :sort_fields => :post } do |forms|\n    forms.resources :submissions, :collection => { :thank_you => :get }\n  end"
    end
  end
end
