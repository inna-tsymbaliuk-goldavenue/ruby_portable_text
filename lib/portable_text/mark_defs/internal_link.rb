module PortableText
  module MarkDefs
    class InternalLink < Base
      # option :href, default: proc { "" }
      option :internalLink, default: proc { "" }
      option :keyRoute, as: :key_route, default: proc { "" }
      option :language, default: proc { "" }
      option :slug, default: proc { "" }
      option :text, default: proc { "" }
    end
  end
end
