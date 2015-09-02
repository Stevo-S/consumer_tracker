ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  sidebar :Categories, priority: 0 do
    p 'TODO: Add categories'
  end

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
		h1 User.all.count
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
	column max_width: "320px" do
	    panel 'PRODUCTS', id: 'chart' do
		canvas id: 'pie_canvas'
	    end
	    panel 'Top 5 Products' do
		canvas id: 'bar_chart_canvas'
		render 'bar_chart'
	    end
	    render 'pie_chart'
	end

	column min_width: "525px" do
	    panel 'Messages' do
		canvas id: 'canvas', height: "360", width: "500"
	    end
	    render 'line_chart'
	end
    end # end of row 1

    columns do
	column max_width: 700 do
	    panel 'Categories' do
		canvas id: 'categories_bar_chart_canvas', height: "350", width: "600"
		render 'categories_bar_chart'
	    end
	end
    end

  end # content
end
