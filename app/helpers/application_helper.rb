module ApplicationHelper
  def get_converted_amount(amount)
    require 'converter'
    conv = Converter.new(amount)
    conv.convert!
  end
	def layout_by_resource
		if devise_controller? && resource_name == :user && action_name == 'sign_in'
		  "devise"
		else
		  "application"
		end
    binding.pry
		if current_user.blank? 
			link_to 'Log out', "destroy_user_session_path", :method => "DELETE"
		end
	end
end
