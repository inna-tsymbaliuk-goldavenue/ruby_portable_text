require "test_helper"

class PortableText::Html::SerializerTest < Minitest::Test
  include Phlex::Testing::ViewHelper

  def test_it_renders_blocks_concatenated
    blocks = [
      PortableText::BlockTypes::Block.new(
        _key: "36be0ac1493e",
        _type: "block",
        markDefs: [],
        style: "h1"
      ),
      PortableText::BlockTypes::ExternalImage.new(
        _key: "36be0ac1493e",
        _type: "externalImage",
        url: "https://example.com/image.jpg",
        alt: "alt"
      )
    ]

    serializer = PortableText::Html::Serializer.new(blocks)
    assert_equal "<h1></h1><img src=\"https://example.com/image.jpg\" alt=\"alt\">", render(serializer)
  end
end
