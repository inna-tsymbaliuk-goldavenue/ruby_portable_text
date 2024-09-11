module PortableText
  module BlockTypes
    class ExternalImage < Base
      option :alt, default: proc { "" }
      option :url, default: proc { nil }
    end
  end
end
