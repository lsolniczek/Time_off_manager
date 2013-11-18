module TimeOffsHelper

	#change Time off status icon
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

	#change link "/change" depend on Time off status
	def time_off_state_change_link(single_time_off)
		case single_time_off.state
			when "new"
				link_to "zmień", employee_time_off_change_path(@employee, single_time_off)
			when "in_approval"
				#TO DO
			when "accepted"
				#TO DO
			when "rejected"
				#TO DO
			else
				#TO DO
		end
	end

end
