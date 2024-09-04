module PortableText
  module Html
    module MarkDefs
      class InternalLink < Base
        delegate :key_route, :language, :slug, to: :@mark_def

        def view_template(&block)
          # TODO: improve url
          href = "/#{language}/#{key_route}/#{slug}"
          a(href: href, &block)
        end
      end
    end
  end
end
