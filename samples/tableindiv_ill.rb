$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"


PDFGen::document PDF::Writer.new, 0.cm do
  caption " SWOT analysis is a strategic planning method used to evaluate the Strengths, Weaknesses,
 Opportunities, and Threats involved in a project or in a business venture. It involves specifying 
the objective of the business venture or project and identifying the internal and external factors that 
are favorable and unfavorable to achieve that objective. The technique is credited to Albert Humphrey, 
who led a convention at Stanford University in the 1960s and 1970s using data from Fortune 500 companies. ",
    :justification => :left, :font_size => 12

  caption " A SWOT analysis must first start with defining a desired end state or objective. 
A SWOT analysis may be incorporated into the strategic planning model. Strategic Planning, has been 
the subject of much research. Identification of SWOTs are essential because subsequent steps in the process 
of planning for achievement of the selected objective may be derived from the SWOTs. First, the decision 
makers have to determine whether the objective is attainable, given the SWOTs. If the objective is NOT 
attainable a different objective must be selected and the process repeated. The SWOT analysis is often 
used in academia to highlight and identify strengths, weaknesses, opportunities and threats.[citation needed]
 It is particularly helpful in identifying areas for development. The aim of any SWOT analysis is to identify 
the key internal and external factors that are important to achieving the objective. These come from within the 
company's unique value chain. ",
    :justification => :left, :font_size => 12

  div :width => 15.cm, :pad_left => 3.cm do

    table do
      title do
        caption " Table 1. <b>SWOT analysis</b>",
          :justification => :left, :font_size => 10
      end

      body do
        span do
          caption "Strengths",
            :width => av_width / 2, :justification => :center, :font_size => 12,
            :border => true, :border_width => 2  


          caption "Threats",
            :width => av_width / 2, :justification => :center, :font_size => 12,
            :border => true, :border_width => 2  

        end

        span do
          caption " characteristics of the business or team that give it an advantage over others in the industry ",
            :width => av_width / 2, :justification => :left, :font_size => 12, :border => true 


          caption " external elements in the environment that could cause trouble for the business. ",
            :width => av_width / 2, :justification => :left, :font_size => 12, :border => true

        end

        span do  
          caption "Opportunities",
            :width => av_width / 2, :justification => :center, :font_size => 12,
            :border => true, :border_width => 2
          
          caption "Weaknesses",
            :width => av_width / 2, :justification => :center, :font_size => 12,
            :border => true, :border_width => 2  
        end

        span do
          caption " external chances to make greater sales or profits in the environment. ",
            :width => av_width / 2, :justification => :left, :font_size => 12,
            :border => true 

          caption " characteristics that place the firm at a disadvantage relative to others. ",
            :width => av_width / 2, :justification => :left, :font_size => 12,
            :border => true 
        end
  
      end
    end
  end

  caption " SWOT analysis groups key pieces of information into two main categories: 
1.Internal factors - The strengths and weaknesses internal to the organization. 
2.External factors - The opportunities and threats presented by the external environment to the organization.
 Use a PEST or PESTLE analysis to help identify factors The internal factors may be viewed as strengths or 
weaknesses depending upon their impact on the organization's objectives.
 What may represent strengths with respect to one objective may be weaknesses for another objective. 
The factors may include all of the 4P's; as well as personnel, finance, manufacturing capabilities, and so on. 
The external factors may include macroeconomic matters, technological change, legislation, 
and socio-cultural changes, as well as changes in the marketplace or competitive position. 
The results are often presented in the form of a matrix. SWOT analysis is just one method of 
categorization and has its own weaknesses. For example, it may tend to persuade companies to compile
 lists rather than think about what is actually important in achieving objectives. 
It also presents the resulting lists uncritically and without clear prioritization so that, for example, 
weak opportunities may appear to balance strong threats. It is prudent not to eliminate too 
quickly any candidate SWOT entry. The importance of individual SWOTs will be revealed by 
the value of the strategies it generates. A SWOT item that produces valuable strategies is important. 
A SWOT item that generates no strategies is not important. ",
    :justification => :left, :font_size => 12

end.save("#{File.basename(__FILE__, ".rb")}.pdf")
