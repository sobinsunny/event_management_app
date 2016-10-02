require 'rails_helper'

RSpec.describe 'events/edit', type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
                              titile: 'MyString',
                              event_place: 'MyText',
                              amount: 1
    ))
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(@event), 'post' do
      assert_select 'input#event_titile[name=?]', 'event[titile]'

      assert_select 'textarea#event_event_place[name=?]', 'event[event_place]'

      assert_select 'input#event_amount[name=?]', 'event[amount]'
    end
  end
end
