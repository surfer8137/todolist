class TitleParser
  class << self
    def parse(task)
      title = task.title.downcase
      id = task.id

      generate_url_from(title, id)
    end

    private

    def generate_url_from(title, id)
      underscored_title = replace_spaces_with_minus(title)

      %{#{underscored_title}-#{id}}
    end

    def replace_spaces_with_minus(string)
      string.gsub(' ', '-')
    end
  end
end
