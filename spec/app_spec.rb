# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe 'App' do
  it 'shows the to do page when you access to it, where you can see tasks to do' do
    visit '/'

    add_regular_task_with(name: 'I am a task!')

    expect(page).to have_content 'I am a task!'
    expect(page).to have_content 'Done tasks'
  end

  context 'Adding a non important task without a due date' do
    it 'adds the task on the same day and it is shown on the todo page' do
      add_regular_task_with(name: 'test name')

      expect(page).to have_content 'test name'
    end
  end

  context 'Adding a non important task with a due date' do
    it 'adds the task on the the due date we have introduced and it is shown on the todo page' do
      add_regular_task_with(name: 'due date task', date: '2016-07-28')

      expect(page).to have_content 'due date task'
      expect(page).to have_content '2016-07-28'
    end
  end

  context 'Adding an important task' do
    it 'adds the task and it is shown on the todo page in a yellow box' do
      add_regular_task_with(name: 'important task', date: '2016-07-28', important: true)

      expect(page).to have_content 'important task'
      expect(page).to have_css '.important-task-block'
    end
  end

  context 'Finishing a task' do
    it 'moves the task from todo to done' do
      add_regular_task_with(name: 'done task', date: '2016-07-28', important: true)
      Task.find_with(title: 'done task').update_attributes(finished: true)

      visit '/done'

      expect(page).to have_content 'Done tasks'
      expect(page).to have_content 'done task'
    end
  end

  context 'Being on a task page' do
    it 'will show the content of the task' do
      add_regular_task_with(name: 'done task', date: '2016-07-28', important: true, content: 'I am a text')
      task = Task.find_with(title: 'done task').take

      visit %(/#{TitleParser.parse(task)})

      expect(page).to have_content task.body
    end

    it 'can change any field' do
      add_regular_task_with(name: 'task to change', date: '2016-07-28', important: true, content: 'I am a text')
      task = Task.find_with(title: 'task to change').take

      visit %(/#{TitleParser.parse(task)})
      fill_in('title', with: 'task changed')
      click_button('modify')

      expect(page).to have_content 'task changed'
    end
  end
end

def add_regular_task_with(args)
  visit '/add-task'

  fill_in('name', with: args[:name]) if args[:name]
  fill_in('comment', with: args[:content]) if args[:content]
  fill_in('date', with: args[:date]) if args[:date]
  check('important') if args[:important]

  click_button('add')
end
