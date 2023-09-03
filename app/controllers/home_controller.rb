class HomeController < ApplicationController

  def index
    yaml_file_path = Rails.root.join('config', 'resume_data.yml')

    @data = YAML.load_file(yaml_file_path)
    @experience = @data['experience']
    @education = @data['education']
    puts @jobs
  end
end
