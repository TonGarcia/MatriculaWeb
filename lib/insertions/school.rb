require 'singleton'

module Insertions
  class School < Facade
    include Singleton

    def initialize
      self.model = 'School'
      self.file_name = 'schools-sample.csv'
    end
  end
end
