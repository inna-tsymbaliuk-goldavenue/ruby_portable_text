require "test_helper"

class PortableText::Html::BlockTypes::ImageTest < Minitest::Test
  include Phlex::Testing::ViewHelper

  def setup
    @image_params = {
      _key: "36be0ac1493e",
      _type: "image",
      asset: {}
    }
  end

  def new_image(**params)
    PortableText::BlockTypes::Image.new(**@image_params, **params)
  end

  def test_when_no_ref_render_blank
    image = new_image
    html_image = PortableText::Html::BlockTypes::Image.new(image)
    assert_equal "", render(html_image)
  end

  def test_when_asset_has_ref_render_creates_an_img_tag
    image = new_image(asset: { "_ref" => "current-ref" },
                      image_urls: { "current-ref" => "https://example.com/image.jpg" })
    html_image = PortableText::Html::BlockTypes::Image.new(image)
    assert_equal '<img src="https://example.com/image.jpg">', render(html_image)
  end
end
