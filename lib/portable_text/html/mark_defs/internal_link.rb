module PortableText
  module Html
    module MarkDefs
      class InternalLink < Base
        delegate :key_route, :metal_iso, :language, :slug, to: :@mark_def

        def view_template(&block)
          return if slug.blank?
          return unless PortableText::Html.config.routes.available_types.include?(key_route)

          a(href: href, &block)
        end

        def href
          path     = PortableText::Html.config.routes.paths
                                       .dig(language, key_route)
                                       .to_s
                                       .gsub("[metalSlug]", chart_metal)
                                       .gsub("[metal]", metal)
                                       .gsub("[slug]", slug)
          uri      = URI.parse(PortableText::Html.config.routes.base_url)
          uri.path = "/#{language}#{path}"
          uri.to_s
        end

        def chart_metal
          return "" if metal_iso.blank?

          PortableText::Html.config.routes.chart_metals.dig(language, metal_iso) || ""
        end

        def metal
          return "" if metal_iso.blank?

          PortableText::Html.config.routes.metals.dig(language, metal_iso) || ""
        end
      end
    end
  end
end
