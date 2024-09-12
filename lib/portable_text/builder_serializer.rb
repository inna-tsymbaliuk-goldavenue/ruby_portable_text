module PortableText
  class BuilderSerializer
    attr_reader :page_builder, :image_urls, :to

    def initialize(page_builder:, image_urls: {}, to: :html)
      @page_builder = page_builder
      @image_urls = image_urls
      @to = to
    end

    def render
      page_builder.map do |component|
        current_content = content(component)
        next unless current_content

        PortableText::Serializer.new(content: current_content,
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
      end
    end

    def image_content(component)
      component[:image]
        .merge(component.slice(:_key))
        .merge({ styles: component.slice(:align, :alt, :title, :width) })
    end
  end
end
