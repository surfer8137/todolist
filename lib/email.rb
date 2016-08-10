module AppFramework
  class Email
    def initialize(args)
      @fields = args
    end

    def fields
      @fields
    end

    def to
      @fields[:to]
    end

    def from
      @fields[:from]
    end

    def subject
      @fields[:subject]
    end

    def body
      @fields[:body]
    end
  end
end
