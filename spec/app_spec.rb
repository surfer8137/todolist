# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe 'App' do
  it 'shows the add task button' do
    visit '/0'

    expect(page).to have_link('', href: '/add-task')
  end

  context 'Adding a task' do
    it 'shows the task name on the main page' do
      visit '/add-task'

      fill_in('name', with: 'test name')
      click_button('add')

      expect(current_path).to eq('/0')
      expect(page).to have_content 'test name'
    end
  end
end
