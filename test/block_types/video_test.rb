require "test_helper"

class PortableText::BlockTypes::VideoTest < Minitest::Test
  def setup
    @params = {
      _key: "123",
      _type: "videoComponent",
      align: "center",
      title: "title",
      width: "100%",
      url: "https://example.com"
    }

    @video = new_video(**@params)
  end

  def new_video(**params)
    PortableText::BlockTypes::Video.new(**params)
  end

  def test_video_is_a_child_of_base
    assert PortableText::BlockTypes::Video < PortableText::BlockTypes::Base
  end

  def test_key_is_mandatory
    error = assert_raises(KeyError) do
      new_video(**@params.except(:_key))
    end

    assert_includes(error.message, "_key")
  end

  def test_responds_to_align
    assert_respond_to(@video, :align)
    assert_equal("center", @video.align)
  end

  def test_responds_to_title
    assert_respond_to(@video, :title)
    assert_equal("title", @video.title)
  end

  def test_responds_to_width
    assert_respond_to(@video, :width)
    assert_equal("100%", @video.width)
  end

  def test_responds_to_url
    assert_respond_to(@video, :url)
    assert_equal("https://example.com", @video.url)
  end
end
