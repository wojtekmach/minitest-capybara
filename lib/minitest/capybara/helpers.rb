module Minitest
  module Capybara
    module Helpers
      def self.failure_message(description, options={})
        "expected to find #{description}" + count_message(options)
      end

      def self.negative_failure_message(description, options={})
        "expected not to find #{description}" + count_message(options)
      end

      def self.declension(singular, plural, count)
        if count == 1
          singular
        else
          plural
        end
      end

      def self.count_message(options)
        if options[:count]
          " #{options[:count]} #{declension('time', 'times', options[:count])}"
        elsif options[:between]
          " between #{options[:between].first} and #{options[:between].last} times"
        elsif options[:maximum]
          " at most #{options[:maximum]} #{declension('time', 'times', options[:maximum])}"
        elsif options[:minimum]
          " at least #{options[:minimum]} #{declension('time', 'times', options[:minimum])}"
        else
          ""
        end
      end
    end
  end
end
