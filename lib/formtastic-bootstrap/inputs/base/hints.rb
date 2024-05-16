module FormtasticBootstrap
  module Inputs
    module Base
      module Hints

        include Formtastic::Inputs::Base::Hints

        def hint_html(inline_or_block = :block)
          if hint?
            hint_class = if inline_or_block == :inline
              options[:hint_class] || builder.default_inline_hint_class
            else
              options[:hint_class] || builder.default_block_hint_class
            end
            template.content_tag(
              :span,
              # Formtastic::Util.html_safe(hint_text),
              html_safe(hint_text),
              :class => hint_class
            )
          end
        end

        # method from formtastic 3.1
        def html_safe(text)
          if text.respond_to?(:html_safe)
            text.html_safe
          else
            text
          end
        end
      end
    end
  end
end

