# frozen_string_literal: true

module MaterialDesignIcons
  module IconHelper
    # Creates an icon tag given an icon name and possible icon
    # modifiers.
    #
    # Examples
    #
    #   mdi_icon "sheep"
    #   # => <i class="mdi md-sheep"></i>
    #
    def mdi_icon(names = 'sheep', original_options = {})
      options = original_options.deep_dup
      classes = ['mdi']
      classes.concat Private.icon_names(names)
      classes.concat Array(options.delete(:class))
      text = options.delete(:text)
      right_icon = options.delete(:right)
      icon = content_tag(:i, nil, options.merge(class: classes))
      Private.icon_join(icon, text, right_icon)
    end

    module Private
      extend ActionView::Helpers::OutputSafetyHelper

      def self.icon_join(icon, text, reverse_order = false)
        return icon if text.blank?

        elements = [icon, ERB::Util.html_escape(text)]
        elements.reverse! if reverse_order
        safe_join(elements, ' ')
      end

      def self.icon_names(names = [])
        array_value(names).map { |n| "mdi-#{n}" }
      end

      def self.array_value(value = [])
        value.is_a?(Array) ? value : value.to_s.split(/\s+/)
      end
    end
  end
end
