module ApplicationHelper
  def flash_message
    messages = ""
    if flash[:notice]
      messages +=
          "<div class= \"alert alert-success alert-dismissable\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>#{flash[:notice]}</div>"
    else
      [:alert, :error].each do |type|
        if flash[type]
          messages +=
              "<div class= \"alert alert-danger alert-dismissable\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>#{flash[type]}</div>"
        end
      end
    end
    messages
  end
end
