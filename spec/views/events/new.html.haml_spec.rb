require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :name => "MyText",
      :description => "MyText",
      :start_time => '2016-12-10 18:06:00 -0500',
      :end_time => '2016-12-12 18:06:00 -0500',
      :user_id => 1
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "textarea#event_name[name=?]", "event[name]"

      assert_select "textarea#event_description[name=?]", "event[description]"

      assert_select "input#event_start_time[name=?]", "event[start_time]"

      assert_select "input#event_end_time[name=?]", "event[end_time]"
    end
  end
end
