# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def text_area_options
    { :rows => 5, :cols => 80 }
  end

  def format_to_dollars input
    sprintf("$%.2f", input.to_f)
  end

end
