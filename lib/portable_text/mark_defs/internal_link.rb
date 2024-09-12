module PortableText
  module MarkDefs
    class InternalLink < Base
      option :keyRoute, as: :key_route, default: proc { "" }
      option :metalIso, as: :metal_iso, default: proc { "" }
      option :language, default: proc { "" }
      option :slug, default: proc { "" }
      option :text, default: proc { "" }
    end
  end
end
