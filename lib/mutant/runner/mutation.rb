# encoding: utf-8

module Mutant
  class Runner
    # Mutation runner
    class Mutation < self
      include Equalizer.new(:config, :mutation, :tests)

      register Mutant::Mutation

      # Return mutation
      #
      # @return [Mutation]
      #
      # @api private
      #
      attr_reader :mutation

      # Return killers
      #
      # @return [Killer]
      #
      # @api private
      #
      attr_reader :killers

      # Initialize object
      #
      # @param [Config] config
      # @param [Mutation] mutation
      # @param [Enumerable<Test>] tests
      #
      # @return [undefined]
      #
      # @api private
      #
      def initialize(config, mutation, tests)
        @mutation, @tests = mutation, tests
        super(config)
      end

      # Test if mutation was handeled successfully
      #
      # @return [true]
      #   if successful
      #
      # @return [false]
      #   otherwise
      #
      # @api private
      #
      def success?
        killers.any?(&:success?)
      end

    private

      # Perform operation
      #
      # @return [undefined]
      #
      # @api private
      #
      def run
        progress(mutation)
        @killers = @tests.map do |test|
          Mutant::Killer.new(
            mutation: mutation,
            test:     test
          )
        end.map(&method(:visit))
        progress(self)
      end

    end # Mutation
  end # Runner
end # Mutant
