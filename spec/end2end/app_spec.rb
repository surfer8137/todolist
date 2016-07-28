require 'spec_helper'

describe 'App' do
  it 'shows the to do page when you access to it, where you can see tasks to do' do
    Task.create_with(title: 'I am a task!')

    visit '/'

    expect(page).to have_content 'I am a task!'
    expect(page).to have_content 'Done tasks'
  end
end
