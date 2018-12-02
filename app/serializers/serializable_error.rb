class SerializableError
  def self.call(title:, detail:)
    {
      errors: [
        {
          title: title,
          detail: detail,
          source: {}
        }
      ],
      jsonapi: { version: "1.0" }
    }
  end
end
