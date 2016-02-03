class Test < ActiveRecord::Base
  has_one :test_configuration
  has_many :questions
end
