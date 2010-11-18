$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"


table_data = {:columns => ['Software requirements', 'Software design',
                           'Software contractions', 'Software Testing', 'Software maintenance'],

              :body => [["Requirements fundamentals", "Design fundamentals",
                         "Software contractions fundamentals", "Software testing fundamentals",
                         "Software maintenance fundamentals"],
                        ["Requirements process", "Key issues in software design",
                         "Managing constructions", "Test levels", "Key issues in software maintenance"],
                        ["Requirements ellocation", "Software structure and architecture",
                         "Practical considerations", "Test techniques", "Maintenance process"],
                        ["Requirements analyses", "Design quality analyses and evaluation", " ",
                         "Test related messures", "Techniques for maintenance"],
                        ["Requirements specification", "Design notations", " ", "Test processes",
                         " "],
                        ["Requirements validation", "Design strategy and methods", " ", " ", " "]] }


PDFGen::document PDF::Writer.new, 0.5.cm do

  div :horizontal_interval => 1.cm,
      :pad_left => 1.cm, :pad_right => 1.cm do


            table :data_source => table_data, :repeat_header_on_each_page => true do

              title do
                span :pad_top => 1.cm, :pad_bottom => 1.cm do
                  caption "SWEBOK STRUCTURE, main processes", :width => av_width * 3/7,
                          :justification => :center,
                          :pad_top => 1.05.cm, :pad_bottom => 1.cm, :font_size => 22,
                          :text_color => Color::RGB::Green
                  div :width => av_width * 4/7, :background_color => Color::RGB::LightGrey,
                      :border => true, :border_width => 2, :border_color => Color::RGB::Green do
                            
                              caption "IEEE",
                                      :justification => :center, :pad_top => 1.cm,
                                      :font_size => 24, :text_color => Color::RGB::DarkGrey
                              caption "Computer Society",
                                      :justification => :center, :pad_top => 1.cm, :font_size => 20,
                                      :text_color => Color::RGB::White
                            
                          end
                end
              end

              header do
                row do
                  cell ds.columns[0], :justification => :center, :font_size => 14, :text_color => Color::RGB::Grey
                  cell ds.columns[1], :justification => :center,
                       :font_size => 14, :text_color => Color::RGB::Grey
                  cell ds.columns[2], :justification => :center,
                       :font_size => 14, :text_color => Color::RGB::Grey
                  cell ds.columns[3], :justification => :center,
                       :font_size => 14, :text_color => Color::RGB::Grey
                  cell ds.columns[4], :justification => :center,
                       :font_size => 14, :text_color => Color::RGB::Grey
                end
              end

              body do

                ds.each do |datarow|
                  row do
                    cell datarow[0], :justification => :center,
                         :border_right => true
                    cell datarow[1], :justification => :center,
                         :border_right => true
                    cell datarow[2], :justification => :center,
                         :border_right => true
                    cell datarow[3], :justification => :center,
                         :border_right => true
                    cell datarow[4], :justification => :center
                  end
                end
              end

              footer do
                span :background_color => Color::RGB::LightGrey do
                  caption "About Us: Mission, Vision & Goals, History Awards Program Volunteer Leadership Staff Leadership Nondiscrimination Policy"
                  caption "Contact Us: Customer Service, Key Staff Contacts Advertising Office Locations & Directions Report Website Issue"
                  caption "Member Resources: Renew Membership Access e-Learning Courses Access Safari Books Online Access Books 24x7 Discounted Subscriptions Discounted Conference Registration Chapter Contacts
Username / Password Issues"
                  caption "Volunteer Center: Member & Geographic Activities Educational Activities Professional Activities"
                  caption "For More Information: Press Room Member Resource Guide (PDF) Author Information Request Information"
                  elements :justification => :center, :font_size => 7, :text_color => Color::RGB::White, :width => av_width/5
                end
              end

            end
          end

end.save("#{File.basename(__FILE__, ".rb")}.pdf")


