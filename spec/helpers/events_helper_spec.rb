require 'rails_helper'
RSpec.describe EventsHelper, type: :helper do

  let(:today) { Time.zone.today }
  let(:events) { [event1] }
  let(:event1) { double :even1 }
  let(:new_weekday) { double :new_weekday }
  let(:days_struct) { double :days_struct }
  let(:collection) { [] }

  def fill_with_events
    7.times { collection << events }
  end

  skip '#render_week_days until fixed render extra parameter' do
    pending 'fix render extra parameter'
    before do
      allow(TheClassroom::WeekDay).to receive(:new).
        with(day: anything, events: events).and_return new_weekday
      allow(new_weekday).to receive(:build_day_struct).and_return events
      fill_with_events
    end
    it 'render the weekday partial' do
      expect(helper).to receive(:render).
        with(partial: 'scaffold/widgets/weekday_card/weekday',
             collection: collection, as: :event)
      render_week_days(events)
    end
  end

  skip '#render_day_events until fixed render extra parameter' do
    context 'there are no evens for the day' do
      it ' renders empty events message' do
        expect(helper).to receive(:render).
          with({partial: 'scaffold/widgets/weekday_card/no_events'})
        no_events
      end
    end
    context 'there are events for this day' do
      it 'renders the collection of events for the day' do
        expect(helper).to receive(:render).exactly(7).times.
          with(partial: 'scaffold/widgets/weekday_card/day_event',
               collection: events, as: :event)
        render_day_events events
      end
    end
  end
end
