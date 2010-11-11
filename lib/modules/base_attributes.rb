module BaseAttributes

  module ClassMethods
    def common_setter(*setters)
      setters.each do |set|
        define_method("#{set}=") do |val|
          if val && set != val
            self.instance_variable_set("@#{set}",val)
            clear_minimal_height
          end
        end
      end
    end
  end

  extend ClassMethods

  def self.included(base)
    base.extend(ClassMethods)
  end

  attr_accessor :background_color

  def var_init
    @width = 0 #document.pdf.page_width - document.pdf.left_margin - document.pdf.right_margin
    @height = 0

    @pad_top = 0
    @pad_bottom = 0
    @pad_left = 0
    @pad_right = 0

    @border_top = false
    @border_left = false
    @border_right = false
    @border_bottom = false
    @border_style = :solid
    @border_width = 1
    @border_color = Color::RGB::Black

    @is_breakable = false

    @background_color = nil
  end

  def breakable?
    @is_breakable
  end

  attr_writer :is_breakable, :height

  def height
    [minimal_height, @height].max
  end

  #padding from the page top after page break
  attr_accessor :page_pad_top

  common_setter :pad_left, :pad_right, :pad_top, :pad_bottom, :width

  attr_reader :width

  attr_accessor :border_top, :border_bottom, :border_left, :border_right,
    :border_style, :border_color, :border_width

  def border= value
    self.border_top = self.border_bottom = self.border_left =
      self.border_right = value
  end

  attr_reader :pad_top, :pad_bottom, :pad_left, :pad_right

  def paddings=(value)
    @pad_bottom = @pad_left = @pad_right = @pad_top = value
  end

  def border_params
    border_type = {:solid => [1, 0], :dotted => [1, 1], :none => [0, 1]}
    PDF::Writer::StrokeStyle.new(@border_width, :dash => {:pattern => border_type[@border_style]})
  end

end