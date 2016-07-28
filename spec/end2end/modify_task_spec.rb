describe 'Task page' do
  context 'Being on a task page' do
    it 'will show the content of the task' do
      Task.create_with(title: 'name', description: 'content')

      visit '/name-1'

      expect(page).to have_content 'name'
      expect(page).to have_content 'content'
    end

    it 'can change any field' do
      Task.create_with(title: 'name',  description: 'description')

      visit '/name-1'
      fill_in('title', with: 'task changed')

      click_button('save')

      expect(page).to have_content 'task changed'
    end
  end
end


def add_regular_task_with(args)
  visit '/add-task'

  fill_in('name', with: args[:title]) if args[:title]
  fill_in('comment', with: args[:description]) if args[:description]
  fill_in('date', with: args[:finish_time]) if args[:finish_time]
  check('important') if args[:important]

  click_button('add')
end
