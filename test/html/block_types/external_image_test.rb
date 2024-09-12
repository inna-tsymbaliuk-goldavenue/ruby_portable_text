require "test_helper"

class PortableText::Html::BlockTypes::ExternalImageTest < Minitest::Test
  include Phlex::Testing::ViewHelper

  def setup
    @image_params = {
      _key: "36be0ac1493e",
      _type: "externalImage",
      alt: "alt text"
    }
  end

  def new_image(**params)
    PortableText::BlockTypes::ExternalImage.new(**@image_params, **params)
  end

  def test_when_no_url_render_blank
    html_image = PortableText::Html::BlockTypes::ExternalImage.new(new_image)
    assert_equal "", render(html_image)
  end

  def test_when_has_url_render_creates_an_img_tag
    image = new_image(url: "https://example.com/image.jpg")
    html_image = PortableText::Html::BlockTypes::ExternalImage.new(image)
    assert_equal '<img src="https://example.com/image.jpg" alt="alt text">', render(html_image)
  end
end
