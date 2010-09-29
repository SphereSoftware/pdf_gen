require "pdf/writer"
#Extension of the standard Fixnum class
#with PDF  - related units conversions
class Fixnum

  #cm2pts
  def cm
    PDF::Writer.cm2pts(self)
  end

  #in2pts

  def in
    PDF::Writer.in2pts(self)
  end

end