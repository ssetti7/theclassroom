require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
          :name => 'MyText',
          :description => 'MyText description',
          :start_time => '2016-12-10 18:06:00 -0500',
          :end_time => '2016-12-12 18:06:00 -0500',
          :user_id => 2
      ),
      Event.create!(
          :name => 'MyText2',
          :description => 'MyText2 description',
          :start_time => '2016-12-10 18:06:00 -0500',
          :end_time => '2016-12-12 18:06:00 -0500',
          :user_id => 2
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 1
    assert_select "tr>td", :text => "MyText2".to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
