require "artoo/drivers/driver"

module Artoo
  module Drivers
    class Neomatrix < Driver
      COMMANDS = [:on, :off, :on?, :off?].freeze

      def initialize(params = {})
        @is_on = Hash.new(false)
        super
      end

      def on?(x,y)
        @is_on[[x,y]]
      end

      def off?(x,y)
        !on?([x,y])
      end

      def on(x, y, red, green, blue)
        change_state(pin, x, y, red, green, blue)
        @is_on[[x,y]] = true
      end

      def off(x, y)
        change_state(pin, x, y, 0, 0, 0)
        @is_on[[x,y]] = false
      end

      private

      def change_state(x, y, red, green, blue)
        connection.neomatrix(x, y, red, green, blue)
      end
    end
  end
end