require 'singleton'

module Insertions
  class Facade
    include Singleton
    attr_accessor :file_name, :model, :specific_attrs, :additional_columns, :additional_vals

    def load_and_persist(show_progress=false, pagination=0)
      start_time = Time.now
      puts "Opening CSV at #{start_time}".colorize(:yellow)
      dataset_path = File.join(Rails.root, 'data', self.file_name)

      count = 0
      headers = []
      registers = []

      excluded_attrs = %w(address previous_name)

      File.open(dataset_path) do |f| #, 'r:ISO-8859-1'
        while line = f.gets
          register = []
          line = line.strip
          if count == 0
            line.downcase!
          end
          line.gsub!('"', '') unless line.index('"').nil?
          columns = line.split(';')
          columns = line.split(',') if columns.length == 1
          skip_register = false

          if count == 0
            headers = columns
            count = count+1
            next
          end

          columns.each_with_index do |val, i|
            attr = headers[i]
            next if excluded_attrs.include?(attr) || (!self.specific_attrs.nil? && !self.specific_attrs.include?(attr))
            register << val
          end

          if (!self.additional_columns.nil? && self.additional_columns.length > 0) && (!self.additional_vals.nil? && self.additional_vals.length > 0)
            self.additional_columns.each_with_index do |add_col, i|
              register << self.additional_vals[i]
            end
          end

          self.specific_attrs.nil? ? import_headers = headers - excluded_attrs : import_headers = self.specific_attrs
          import_headers += self.additional_columns if !self.additional_columns.nil? && self.additional_columns.length > 0

          #if headers.length != register.length
          #  count_missing_elements = headers.length - register.length
          #  count_missing_elements.times do |i|
          #    register << ''
          #  end
          #end

          next if skip_register
          registers << register if register.length == import_headers.length
          count = count+1

          if show_progress
            if pagination == 0 || (count % pagination == 0)
              p "#{count} iterated registers at #{Time.now}"
              start_time = Time.now
              puts 'Insertion started'.colorize(:yellow)
              self.specific_attrs.nil? ? import_headers = headers - excluded_attrs : import_headers = self.specific_attrs
              import_headers += self.additional_columns if !self.additional_columns.nil? && self.additional_columns.length > 0

              imp = self.model.classify.safe_constantize.import import_headers, registers, validate: false
              end_time = Time.now
              p "Spent Time (insertion): #{end_time - start_time}"

              # count == 1000000 ? break : count=count+1 # TODO Comment if not a test
              registers = [] #free memory
            end
          end
        end

        unless show_progress
          self.specific_attrs.nil? ? import_headers = headers - excluded_attrs : import_headers = self.specific_attrs
          self.model.classify.safe_constantize.import import_headers, registers, validate: false
        end
      end

      puts "CSV #{file_name} finished at #{start_time}".colorize(:green)
    end
  end
end
