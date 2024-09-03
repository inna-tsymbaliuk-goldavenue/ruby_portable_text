module PortableText
  module Html
    module BlockTypes
      class Video < Html::BaseComponent
        param :video

        delegate :align, :title, :width, :url, to: :@video

        def view_template
          return unless url
          
          figure {
            iframe(src: url, width:, title:)
          }
        end
      end
    end
  end
end
