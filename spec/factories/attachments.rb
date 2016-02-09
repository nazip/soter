FactoryGirl.define do
  factory :attachment do
    # "MyFile"
     file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'rails_helper.rb')) }
  end

end
