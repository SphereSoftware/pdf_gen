$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"

long_text = <<TEXT 
 A Software Requirements Specification (SRS) - a requirements
specification for a software system - is a complete description of the behavior
 of a system to be developed. It includes a set of use cases that describe all 
the interactions the users will have with the software. 
Use cases are also known as functional requirements. 
In addition to use cases, the SRS also contains non-functional 
(or supplementary) requirements. Non-functional requirements are requirements 
which impose constraints on the design or implementation
(such as performance engineering requirements, quality standards, 
or design constraints).

TEXT
PDFGen::document PDF::Writer.new, 2.cm do
  caption ' Software Requirements Specification ', :text_color => Color::RGB::Grey, 
          :font_size => 16, :bold => true, :justification => :center

  caption long_text,
    :text_color => Color::RGB::Grey, :font_size => 12, :justification => :left,
    :pad_left => 2.5.cm, :pad_right => 2.cm

  div :width => 20.cm, :horizontal_interval => 0.5.cm do
  
    span :pad_left => 2.cm, :pad_top => 2.cm do
      caption '1', :width => 2.cm
      caption 'INTRODUCTION', :width => 12.cm 
    end    
    span :width => 16.cm, :pad_left => 2.5.cm do
      caption '1.1', :width => 2.cm
      caption 'Product Overview', :width => 10.cm  
    end
    span :width => 16.cm, :pad_left => 2.5.cm do
      caption '1.2', :width => 2.cm
      caption 'Purpose', :width => 10.cm  
    end
    span :width => 16.cm, :pad_left => 2.5.cm do
      caption '1.3', :width => 2.cm
      caption 'Scope', :width => 10.cm  
    end
    span :width => 16.cm, :pad_left => 2.5.cm do
      caption '1.4', :width => 2.cm
      caption 'Reference', :width => 10.cm   
    end
    span :width => 16.cm, :pad_left => 2.5.cm do
      caption '1.4', :width => 2.cm
      caption 'Definitions and Abbreviations', :width => 10.cm   
    end
    span  :pad_left => 2.cm do
      caption '2', :width => 2.cm
      caption 'OVERALL DESCRIPTION', :width => 12.cm 
    end
    span :width => 18.cm, :pad_left => 2.cm do
      caption '3', :width => 2.cm
      caption 'SPECIFIC REQUIREMENTS', :width => 12.cm  
    end
    span :width => 18.cm, :pad_left => 2.cm do
      caption '4', :width => 2.cm
      caption 'ADDITIONAL MATERIALS', :width => 12.cm  
    end
    
  end
end.save("#{File.basename(__FILE__, ".rb")}.pdf")

