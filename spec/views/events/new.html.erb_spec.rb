require 'rails_helper'

RSpec.describe 'events/new', type: :view do
  before(:each) do
    assign(:event, Event.new(
                     titile: 'MyString',
                     event_place: 'MyText',
                     amount: 1
    ))
  end

  it 'renders new event form' do
    render

    assert_select 'form[action=?][method=?]', events_path, 'post' do
      assert_select 'input#event_titile[name=?]', 'event[titile]'

      assert_select 'textarea#event_event_place[name=?]', 'event[event_place]'

      assert_select 'input#event_amount[name=?]', 'event[amount]'
    end
  end
end
