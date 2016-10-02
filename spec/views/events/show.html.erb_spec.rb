require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
                              titile: 'Titile',
                              event_place: 'MyText',
                              amount: 2
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Titile/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
