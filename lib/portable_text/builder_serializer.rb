module PortableText
  class BuilderSerializer
    attr_reader :page_builder, :image_urls, :to, :converted

    def initialize(page_builder:, image_urls: [], to: :html)
      @page_builder = page_builder
      @image_urls = image_urls
      @to = to
    end

    def render
      page_builder.map do |component|
        PortableText::Serializer.new(content: content(component),
                                     image_urls: image_urls,
                                     to: to).render.call
      end.join
    end

    private

    def content(component)
      case component[:_type]
      when "textEditor"
        component[:portableText]
      when "videoComponent"
        Array.wrap(component)
      when "imageComponent"
        Array.wrap(image_content(component))
      when "buttonGroup"
        component[:buttons]
      else
        ""
      end
    end

    def image_content(component)
      component[:image].merge({ styles: component.slice(:align, :alt, :title, :width) })
    end
  end
end
