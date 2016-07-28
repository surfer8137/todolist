class TitleParser
  class << self
    def parse(task)
      task.title.tr(' ', '_').downcase << %(-#{task.id})
    end
  end
end
