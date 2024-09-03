module PortableText
  module BlockTypes
    class ExternalImage
      extend Dry::Initializer

      option :_key, as: :key
      option :_type, as: :type
      option :alt, default: proc { '' }
      option :url, default: proc { nil }
    end
  end
end
