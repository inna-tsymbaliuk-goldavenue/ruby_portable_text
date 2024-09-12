require "test_helper"

class PortableText::Html::BlockTypes::VideoTest < Minitest::Test
  include Phlex::Testing::ViewHelper

  def setup
    @video_params = {
      _key: "36be0ac1493e",
      _type: "videoComponent",
      width: "100%",
      title: "test"
    }
  end

  def new_video(**params)
    PortableText::BlockTypes::Video.new(**@video_params, **params)
  end

  def test_when_no_url_render_blank
    html_video = PortableText::Html::BlockTypes::Video.new(new_video)
    assert_equal "", render(html_video)
  end

  def test_when_has_url_render_creates_an_video_iframe
    video = new_video(url: "https://example.com/video")
    html_video = PortableText::Html::BlockTypes::Video.new(video)
    result = '<figure><iframe src="https://example.com/video" width="100%" title="test"></iframe></figure>'
    assert_equal result, render(html_video)
  end
end
