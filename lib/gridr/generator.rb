class Gridr::Generator
  class << self
    def generate(opts = {})
      self.new(opts).generate
    end
  end

  def initialize(opts = {})
    @opts = defaults.merge(opts)
  end

  def generate
    File.open(@opts[:file_name], 'w+') { |f| f.write(grid_css) }
  end

  private

  def grid_css
    css = [".row { overflow: hidden; }"]
    css_classes = []
    css_for_columns = []
    css_for_left_offsets = []
    css_for_right_offsets = []

    (1..@opts[:columns]).to_a.map do |n|
      class_name = @opts[:column_class].gsub("NUM", n.to_s)
      css_classes << class_name
      css_for_columns << "#{class_name} { width: #{numbered_column_width(n)}%; }"

      left_offset_class_name = @opts[:left_offset_class].gsub("NUM", n.to_s)
      right_offset_class_name = @opts[:right_offset_class].gsub("NUM", n.to_s)

      unless n == @opts[:columns]
        css_for_left_offsets << "#{left_offset_class_name} {margin-left: #{numbered_column_width(n) + (@opts[:margin] + @opts[:padding]) * 2}; }"
        css_for_right_offsets << "#{right_offset_class_name} { margin-right: #{numbered_column_width(n) + (@opts[:margin] + @opts[:padding]) * 2 }; }"
      end
    end

    shared_styles = css_classes.join(', ') << " { float: left; margin: #{@opts[:margin]}; padding: #{@opts[:padding]}; }"

    css << shared_styles << css_for_columns << css_for_left_offsets << css_for_right_offsets

    css.join("\n\n")
  end

  def numbered_column_width(n)
    single_column_width * n + (@opts[:margin] + @opts[:padding]) * 2 * (n - 1)
  end

  def single_column_width
    (100.0 / @opts[:columns]) - (@opts[:margin] + @opts[:padding]) * 2
  end

  def defaults
    {
      file_name: 'grid.css',
      columns: 12,
      margin: 0.5,
      padding: 0,
      column_class: '.col-NUM',
      left_offset_class: '.lo-NUM',
      right_offset_class: '.ro-NUM'
    }
  end
end
