require 'spec_helper'

describe 'TitleParser' do
  context 'Given a task with an ID and a title' do
    it 'generates a valid URL' do
      task = Task.create(title: 'A task name')
      second_task = Task.create(title: 'Second task')

      expect(TitleParser.parse(task)).to eq('a-task-name-1')
      expect(TitleParser.parse(second_task)).to eq('second-task-2')
    end
  end
end
