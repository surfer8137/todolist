describe 'CSVMaker' do
  context 'Given an empty database table' do
    it 'builds a document with the attributes of the table' do
      output = CSVMaker.make

      expect(output).to eq('id,title,description,finish_time,finished_at,finished,important,created_at,updated_at')
    end
  end

  context 'Given a non empty database table' do
    xit 'builds a document with the attributes of the table and the attribute values' do
      task = Task.create_with(name: 'task')
      output = CSVMaker.make
      puts task.attributes.values

      expect(output).to eq(
      "id,title,description,finish_time,finished_at,finished,important,created_at,updated_at\n1,,,,,false,,2016-07-28 13:43:01 UTC,2016-07-28 13:43:01 UTC"
      )
    end
  end
end
