module PortableText
  module Html
    module BlockTypes
      class Image < Html::BaseComponent
        param :image

        def view_template
          return unless @image.asset.key?("_ref")

          img(src: @image.asset["_ref"])
        end
      end
    end
  end
end
