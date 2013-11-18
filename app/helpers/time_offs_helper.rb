module TimeOffsHelper

	def time_off_state_ico(single_time_off)
		case single_time_off.state
			when "new"
				content_tag(:p, "Nowy", class: "label label-primary")
			when "in_approval"
				content_tag(:p, "W akceptacji", class: "label label-warning")
			when "accepted"
				content_tag(:p, "Zaakceptowany", class: "label label-success")
			when "rejected"
				content_tag(:p, "Odrzucony", class: "label label-danger")
			else
				content_tag(:p, "Anulowany", class: "label label-default")
		end
	end

end
