def register
  visit '/'
  fill_in 'name', with: 'Dave'
  click_button 'Submit'
end
