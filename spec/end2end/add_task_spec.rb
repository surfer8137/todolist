describe 'Task addition' do
  context 'Adding a non important task without a due date' do
    it 'adds the task on the same day and it is shown on the todo page' do
      visit '/add-task'

      fill_in('title', with: 'test name')

      click_button('add')

      expect(page).to have_content 'test name'
    end
  end

  context 'Adding a non important task with a due date' do
    it 'adds the task on the the due date we have introduced and it is shown on the todo page' do
      visit '/add-task'

      fill_in('title', with: 'test name')
      fill_in('finish_time', with: '2016-07-28')

      click_button('add')

      expect(page).to have_content '2016-07-28'
    end
  end

  context 'Adding an important task' do
    it 'adds the task and it is shown on the todo page in a yellow box' do
      visit '/add-task'

      fill_in('title', with: 'important task')
      check('important')

      click_button('add')

      expect(page).to have_css '.important-task-block'
    end
  end
end
