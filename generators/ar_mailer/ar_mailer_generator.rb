class ArMailerGenerator < Rails::Generator::NamedBase

  def initialize(runtime_args, runtime_options = {})
    runtime_args.unshift('Email') if runtime_args.empty?
    super
  end

  def manifest
    record do |m|
      m.class_collisions class_name
      
      m.template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")

      m.migration_template 'migration.rb', 'db/migrate', :assigns => {
        :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}"
      }, :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"
    end
  end

  protected
    def banner
      "Usage: #{$0} #{spec.name} EmailModelName (default: Email)"
    end

end
