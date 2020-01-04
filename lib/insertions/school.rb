require 'singleton'

module Insertions
  class School < Facade
    include Singleton

    def initialize
      self.model = 'School'
      self.file_name = 'processed_schools_df_merged.csv'
      #self.file_name = 'schools-sample.csv'

      #self.additional_vals = [1]
      #self.additional_columns = ['user_id']
    end
  end
end
