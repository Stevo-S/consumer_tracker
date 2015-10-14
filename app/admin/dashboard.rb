ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

#  sidebar :Categories, priority: 0 do
#    details do
#	summary do
#	    strong 'Categories list'
#	end
#
#	ul do
#	    Category.all.each do |category|
#		li category.name
#	    end
#	end
#    end
#  end

  content title: proc{ I18n.t("active_admin.dashboard") } do
# div class: "blank_slate_container", id: "dashboard_default_message" do
#       span class: "blank_slate" do
#        span I18n.t("active_admin.dashboard_welcome.welcome")
#        small I18n.t("active_admin.dashboard_welcome.call_to_action")
#      end
#    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
    

    columns do
	column do
	    panel "PRODUCTS" do
		h1 Product.all.count
	    end
	end
	column do
	    panel "ACCOUNTS" do
		h1 Account.all.count
	    end
	end
	column do
	    panel "USERS" do
	    	span class: "glyphicon glyphicon-user", aria_hidden: true
		h1 User.all.count
	    end
	end
	column do
	    panel "LOGGED IN" do
		h1 "1"
	    end
	end
	column do
	    panel "RECEIVED MESSAGES" do
		h1 IncomingMessage.all.count
	    end
	end
    end

    br

    columns do
	column  do
	    panel 'Categories' do
		canvas id: 'categories_bar_chart_canvas', height: "350", width: "500"
		render 'categories_bar_chart'
	    end
	end

	column  do
	    panel 'Messages' do
		canvas id: 'canvas', height: "360", width: "500"
	    end
	    render 'line_chart'
	end
    end # end of row 1

    columns do
	column  do
	    panel 'PRODUCTS', id: 'chart' do
		canvas id: 'pie_canvas'
	    end
	end

	column  do
	    panel 'Top 5 Products' do
		canvas id: 'bar_chart_canvas', width: 270
		render 'bar_chart'
	    end
	    render 'pie_chart'
	end

	column do
	    panel 'Quarterly Confirmations' do
		canvas id: 'doughnut_canvas'
		render 'quarterly_doughnut'
	    end
	end

    end # end of row 2
  end # content
end
