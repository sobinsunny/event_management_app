module EventsHelper

  def personalized_entry_fee(amount)
    return amount if current_user.gender == 'Male' 
    amount - amount * 0.05 # female has 5% discount
  end

  def confirmation_link(event)
    if has_confirmed(event)
      link_to 'Cancel', remove_user_event_event_path(event), method: :delete, class: 'btn btn-warning', html: { id: 'action_link' }
    else
      link_to 'Yes,I am in', set_user_event_event_path(event), method: :post, class: 'btn btn-success', html: { id: 'ajax_link' }
    end
  end

  def has_confirmed(event)
    event.user_events.find_by_user_id(current_user.id)
  end

end
