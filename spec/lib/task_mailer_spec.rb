require 'spec_helper'

describe 'TaskMailBuilder' do
  context 'Having a task that finishes today' do
    it 'is sent an email daily warning about tasks like that' do
      Task.create_with(title: 'task', finish_time: Date.today)

      output = TaskMailBuilder.build

      expected_output = "These are the tasks that finish today:\n-task"
      expect(output.body).to eq(expected_output)
    end
  end
  context 'Having a couple of tasks that finish today' do
    it 'is sent an email daily warning about tasks like that' do
      Task.create_with(title: 'task2', finish_time: Date.today)
      Task.create_with(title: 'task3', finish_time: Date.today)

      output = TaskMailBuilder.build

      expected_output = "These are the tasks that finish today:\n-task2\n-task3"
      expect(output.body).to eq(expected_output)
    end
  end
end
