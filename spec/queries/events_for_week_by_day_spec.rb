require 'spec_helper'

describe 'EventsForWeekByDay' do

  let(:monday) { Time.zone.today.monday }
  let!(:monday_event) do
    FactoryGirl.create(:event,
                       start_time: monday.at_beginning_of_day,
                       end_time: monday.at_end_of_day)
  end
  let!(:tuesday_event) do
    FactoryGirl.create(:event,
                       start_time: monday.next_day.at_beginning_of_day,
                       end_time: monday.next_day.at_end_of_day)
  end

  describe '.all' do
    subject do
      EventsForWeekByDay.all(day: Time.zone.today)
    end

    it 'returns monday event in the first array' do
      expect(subject.first).to be_eql monday_event
    end

    it 'returns monday event in the second array' do
      expect(subject.second).to be_eql tuesday_event
    end

    it 'returns an array of lenth 2' do
      expect(subject.length).to be_eql 2
    end
  end
end

