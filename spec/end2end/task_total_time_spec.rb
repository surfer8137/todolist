describe 'How much time to do a task' do
  context 'Finishing a task' do
    it 'shows the total time in the done page' do
      task = Task.create_with(title: 'done task')
      Task.finish(task.id)

      visit '/done'
      expect(page).to have_content '0 day/s'
    end
  end
end
