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
	def time_off_state_change_link(employee, single_time_off)
		case single_time_off.state
			when "new"
				render :partial => "time_offs/state_change/change", :locals => {employee: employee, single_time_off: single_time_off}
			when "in_approval"
				render :partial => "time_offs/state_change/inapproval", :locals => {employee: employee, single_time_off: single_time_off}
			when "accepted"
				render :partial => "time_offs/state_change/accepted", :locals => {employee: employee, single_time_off: single_time_off}
			when "rejected"
				render :partial => "time_offs/state_change/rejected", :locals => {employee: employee, single_time_off: single_time_off}
			else
				render :partial => "time_offs/state_change/canceled"
		end
	end

	#translate stante name
	def state_name(state)
		case state
			when "new"
				"Nowy"
			when "in_approval"
				"W akceptacji"
			when "accepted"
				"Zaakceptowany"
			when "rejected"
				"Odrzucony"
			else
				"Anulowany"
		end
	end

end
