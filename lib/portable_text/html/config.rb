module PortableText
  module Html
    class Config
      extend Dry::Configurable

      # Default settings
      # These can be overridden
      # Example: PortableText::Html.config.block.types.merge!({ block: MyCustomBlock })

      setting :block do
        setting :types, default: {
          block:          Html::BlockTypes::Block,
          image:          Html::BlockTypes::Image,
          externalImage:  Html::BlockTypes::ExternalImage,
          list:           Html::BlockTypes::List,
          span:           Html::BlockTypes::Span,
          videoComponent: Html::BlockTypes::Video
        }

        setting :styles, default: {
          h1: { node: :h1 },
          h2: { node: :h2 },
          h3: { node: :h3 },
          h4: { node: :h4 },
          h5: { node: :h5 },
          h6: { node: :h6 },
          blockquote: { node: :blockquote },
          normal: { node: :p },
          li: { node: :li }
        }

        setting :mark_defs, default: {
          link:          Html::MarkDefs::Link,
          internal_link: Html::MarkDefs::InternalLink
        }

        setting :list_types, default: {
          bullet: { node: :ul },
          number: { node: :ol }
        }
      end

      setting :span do
        setting :marks, default: {
          strong: { node: :strong },
          em: { node: :em },
          underline: { node: :u },
          left: { node: :p },
          center: { node: :p, style: 'text-align: center;' },
          right: { node: :p, style: 'text-align: right;' }
        }
      end
    end
  end
end
