module Solve
  class Solver
    # @author Andrew Garson <andrew.garson@gmail.com>
    # @author Jamie Winsor <jamie@vialstudios.com>
    class ConstraintTable
      attr_reader :rows

      def initialize
        @rows = Array.new
      end

      def add(dependency, source)
        @rows << ConstraintRow.new(dependency, source)
      end

      def constraints_on_package(name)
        @rows.select do |row|
          row.name == name
        end.map { |row| row.constraint }
      end

      def remove_constraints_from_source!(source)
        @rows.reject! { |row| row.source == source }
      end
    end
  end
end
