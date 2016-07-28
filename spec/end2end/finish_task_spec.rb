describe 'Finish a task' do
  context 'Being on the todo page' do
    it 'moves the task to done queue' do
      Task.create_with(title: 'done task')

      click_link('finish/1')

      visit '/done'
      expect(page).to have_content 'done task'
    end
  end
end
