require "test_helper"

class PortableText::BlockTypes::ExternalImageTest < Minitest::Test
  def setup
    @params = {
      _key: "123",
      _type: "externalImage",
      alt: "alt text",
      url: "https://example.com"
    }

    @image = new_image(**@params)
  end

  def new_image(**params)
    PortableText::BlockTypes::ExternalImage.new(**params)
  end

  def test_image_is_a_child_of_base
    assert PortableText::BlockTypes::ExternalImage < PortableText::BlockTypes::Base
  end

  def test_key_is_mandatory
    error = assert_raises(KeyError) do
      new_image(**@params.except(:_key))
    end

    assert_includes(error.message, "_key")
  end

  def test_responds_to_alt
    assert_respond_to(@image, :alt)
    assert_equal("alt text", @image.alt)
  end

  def test_responds_to_url
    assert_respond_to(@image, :url)
    assert_equal("https://example.com", @image.url)
  end
end
