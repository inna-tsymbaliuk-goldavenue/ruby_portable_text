module PortableText
  module Html
    module BlockTypes
      class ExternalImage < Html::BaseComponent
        param :image

        delegate :url, :alt, to: :@image

        def view_template
          return unless url

          img(src: url, alt: alt)
        end
      end
    end
  end
end
