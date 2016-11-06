require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    @event = assign(:event,
                    Event.create!(
                    name: 'MyText',
                    description: 'MyText description',
                    start_time: '2016-12-10 18:06:00 -0500',
                    end_time: '2016-12-12 18:06:00 -0500',
                    user_id: 2))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText description/)
    expect(rendered).to match(/2/)
  end
end
