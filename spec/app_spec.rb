# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "App" do
  it 'should allow accessing the home page' do
    visit '/'

    page.should have_content 'Task list'
  end

  it 'should have a button to add tasks' do
    visit '/add-task'
  end

  context 'given the form to add a task on the /add-task page' do
    it 'must have all fields filled to continue' do
      fill_in('name', :with => 'Something') # choose radio button
      fill_in('comment', :with => 'asdasdasd') # choose radio button

      click_button('add') # fill text field

       
    end
  end
end

#Capybara
#Travis
