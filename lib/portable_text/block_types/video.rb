module PortableText
  module BlockTypes
    class Video < Base
      option :align, default: proc { 'center' }
      option :title, default: proc { '' }
      option :width, default: proc { '100%' }
      option :url, default: proc { nil }
    end
  end
end
