require "test_helper"

class PortableText::MarkDefs::InternalLinkTest < Minitest::Test
  def setup
    @params = {
      _key: "123",
      _type: "internalLink",
      keyRoute: "pages",
      metalIso: "XAU",
      language: "en",
      slug: "test-slug"
    }

    @mark_def = new_link(**@params)
  end

  def new_link(**params)
    PortableText::MarkDefs::InternalLink.new(**params)
  end

  def test_link_is_a_child_of_base
    assert PortableText::MarkDefs::InternalLink < PortableText::MarkDefs::Base
  end

  def test_responds_to_key_route
    assert_respond_to(@mark_def, :key_route)
    assert_equal("pages", @mark_def.key_route)
  end

  def test_responds_to_metal_iso
    assert_respond_to(@mark_def, :metal_iso)
    assert_equal("XAU", @mark_def.metal_iso)
  end

  def test_responds_to_language
    assert_respond_to(@mark_def, :language)
    assert_equal("en", @mark_def.language)
  end

  def test_responds_to_slug
    assert_respond_to(@mark_def, :slug)
    assert_equal("test-slug", @mark_def.slug)
  end

  def test_responds_to_text
    assert_respond_to(@mark_def, :text)
    assert_equal("", @mark_def.text)
  end
end
