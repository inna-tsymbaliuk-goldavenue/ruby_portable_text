module PortableText
  module Html
    module BlockTypes
      class Image < Html::BaseComponent
        param :image

        delegate :asset, :styles, :image_urls, to: :@image

        def view_template
          return unless asset.key?("_ref")

          current_url = @image_urls[asset["_ref"]]
          return if current_url.blank?

          img(src: current_url, alt: styles[:alt])
        end
      end
    end
  end
end
