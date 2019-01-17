require_relative 'journey'

class JourneyLog

  attr_reader :journey_history, :journey

  def initialize
    @journey = Journey.new
    @journey_history = []
  end

  def start(station)
    @journey.start_journey(station)
  end

  def finish(station)
    @journey.stop_journey(station)
  end

  def add_to_history
    @journey_history << { entry_station: @journey.entry_station, exit_station: @journey.exit_station }
  end

  def price
    @journey.fare
  end

  def current_journey
    return journey if journey.incomplete_journey?
    @journey = Journey.new
  end
end

# #
# card = Oystercard.new
#                                       @journeyLog calls journey
#     creates  @journey
# card.touch_in(station)
#                                         @journeyLog.start
#         @journey.start
# card.touch_out(station)
#         @journey.end                    @journeylog.end
#         @journey.fare                     @journey.fare
#   oyster card interacts with journey      oystercard deals only with journeylog, which interacts with journey class
#                                             journeylog middle layer
#                                             oystercard doesnt interact with journey
