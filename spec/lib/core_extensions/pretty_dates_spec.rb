require 'spec_time_helper'
require 'core_extensions/pretty_dates'

describe 'CoreExtensions::PrettyDates' do
  let(:am_hour) { Time.new(2016,3,22,10,5) }
  let(:pm_hour) { Time.new(2016,3,22,18,5) }

  before :each do
    Time.zone = ActiveSupport::TimeZone[-5]
  end

  describe '#meridian_hour' do
    context 'when the hour is AM' do
      it 'returns the hour and minute with am' do
        expect(am_hour.meridian_hour).to be_eql '10:05AM'
      end
    end
    context 'when the hour is PM' do
      it 'returns the hour and minute with pm' do
        expect(pm_hour.meridian_hour).to be_eql '06:05PM'
      end
    end
  end
end
