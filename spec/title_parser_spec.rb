describe 'TitleParser' do
  context 'Given task with and ID: 200 and a title: A task name' do
    it 'converts it to a_task_name-200' do
      Task.create_with(name: 'A task name')
      Task.find_with(title: 'A task name').update_attributes(id: 200)
      task = Task.find_with(title: 'A task name').take

      output = TitleParser.parse(task)

      expected_output = 'a_task_name-200'
      expect(output).to eq(expected_output)
    end
  end
  context 'Given task with and ID: 300 and a title: A name' do
    it 'converts it to a_name-300' do
      Task.create_with(name: 'A name')
      Task.find_with(title: 'A name').update_attributes(id: 300)
      task = Task.find_with(title: 'A name').take

      output = TitleParser.parse(task)

      expected_output = 'a_name-300'
      expect(output).to eq(expected_output)
    end
  end
end
