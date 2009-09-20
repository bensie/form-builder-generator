Rails::Generator::Commands::Create.class_eval do
  
  def insert_into(file, line)
    logger.insert "#{line} into #{file}"
    unless options[:pretend]
      gsub_file file, /^(class|module) .+$/ do |match|
        "#{match}\n  #{line}"
      end
    end
  end
  
  def insert_custom_route(route)
    sentinel = 'ActionController::Routing::Routes.draw do |map|'
    logger.insert "Add route: #{route}"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  #{route}\n"
      end
    end
  end
  
end

Rails::Generator::Commands::Destroy.class_eval do
  
  def insert_into(file, line)
    logger.remove "#{line} from #{file}"
    unless options[:pretend]
      gsub_file file, "\n  #{line}", ''
    end
  end
  
  def insert_custom_route(route)
    logger.remove "Remove Route: #{route}"
    unless options[:pretend]
      gsub_file 'config/routes.rb', "\n  #{route}", ''
    end
  end
  
end

Rails::Generator::Commands::List.class_eval do
  
  def insert_into(file, line)
    logger.insert "#{line} into #{file}"
  end
  
end
