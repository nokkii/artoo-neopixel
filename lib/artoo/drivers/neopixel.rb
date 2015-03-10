require "artoo/drivers/driver"

module Artoo
  module Drivers
    class Neopixel < Driver
      COMMANDS = [:on, :off, :on?, :off?].freeze

      attr_reader :count

      def initialize(params = {})
        @is_on = Hash.new(false)
        additional_params = params.fetch(:additional_params) { Hash.new }
        @count = additional_params.fetch(:count)
        super
      end

      def on?(index)
        @is_on[index]
      end

      def off?(index)
        !on?(index)
      end

      def on(index, red, green, blue)
        change_state(index, red, green, blue)
        @is_on[index] = true
      end

      def off(index)
        change_state(index, 0, 0, 0)
        @is_on[index] = false
      end

      private

      def change_state(index, red, green, blue)
        connection.neopixel(index, red, green, blue)
      end
    end
  end
end
