# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe 'App' do
  it 'shows the to do page when you access to it, where you can see tasks to do' do
    visit '/'

    expect(page).to have_content 'Done tasks'
  end

  context 'Being on the to do page' do
    it 'shows the done page when you access to it through its button' do
      visit '/todo'
      click_link 'done'

      expect(page).to have_content 'Done tasks'
    end
  end

  context 'Being on the done page' do
    it 'shows the to do page when you access to it through its button' do
      visit '/done'
      click_link 'todo'

      expect(page).to have_content 'Done tasks'
    end
  end

  it 'shows the add task button on the todo and done pages' do
    visit '/todo'
    expect(page).to have_link('', href: '/add-task')

    visit '/done'
    expect(page).to have_link('', href: '/add-task')
  end

  context 'Adding a non important task without a due date' do
    it 'adds the task on the same day and it is shown on the todo page' do
      task_name = 'test name'
      comment = nil
      date = nil
      important = false

      add_task({name: task_name, content: comment, date: date, important: important})

      expect(page).to have_content 'test name'
    end
  end

  context 'Adding a non important task with a due date' do
    it 'adds the task on the the due date we have introduced and it is shown on the todo page' do
      task_name = 'due date task'
      comment = nil
      date = '2016-07-28'
      important = false

      add_task({name: task_name, content: comment, date: date, important: important})

      expect(page).to have_content 'due date task'
      expect(page).to have_content '2016-07-28'
    end
  end

  context 'Adding an important task' do
    it 'adds the task and it is shown on the todo page in yellow box' do
      task_name = 'important task'
      comment = nil
      date = '2016-07-28'
      important = true

      add_task({name: task_name, content: comment, date: date, important: important})

      expect(page).to have_content 'important task'
      expect(page).to have_css '.important-task-block'
    end
  end
end

def add_task(args)
  visit '/add-task'

  fill_in('name', with: args[:name])
  fill_in('comment', with: args[:content]) if args[:content]
  fill_in('date', with: args[:date]) if args[:date]
  check('important') if args[:important]

  click_button('add')
end
