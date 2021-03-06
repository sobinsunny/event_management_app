require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  before(:each) do
    assign(:events, [
             Event.create!(
               titile: 'Titile',
               event_place: 'MyText',
               amount: 2
             ),
             Event.create!(
               titile: 'Titile',
               event_place: 'MyText',
               amount: 2
             )
           ])
  end

  it 'renders a list of events' do
    render
    assert_select 'tr>td', text: 'Titile'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
