class FileinclusionController < ApplicationController
    def index
    render file: "#{Rails.root}/some/file"
  end
end
