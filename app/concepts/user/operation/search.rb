# frozen_string_literal: true

module User::Operation
  class Search < Trailblazer::Operation
    step :get_users

    def get_users(options, params:, **)
      options['users'] = if options[:is_admin]
                           if(params[:search_keyword].present? && params[:created_from_keyword].blank? && params[:created_to_keyword].blank?)
                              User.where("name LIKE :name or email LIKE :email", {:name => "%#{params[:search_keyword]}%", :email => "%#{params[:search_keyword]}%"})
                           elsif(params [:search_keyword].blank? && params[:created_from_keyword].present? && params[:created_to_keyword].present?)
                              User.where("date(created_at) BETWEEN '#{params[:created_from_keyword]}' AND '#{params[:created_to_keyword]}'")
                           elsif(params[:search_keyword].present? && params[:created_from_keyword].present? && params[:created_to_keyword].present?)
                              User.where("((name LIKE :name or email LIKE :email) && (date(created_at) BETWEEN '#{params[:created_from_keyword]}' AND '#{params[:created_to_keyword]}'))", {:name => "%#{params[:search_keyword]}%", :email => "%#{params[:search_keyword]}%"})
                           elsif(params[:search_keyword].present? && params[:created_from_keyword].present? && params[:created_to_keyword].blank?)
                              User.where("((name LIKE :name or email LIKE :email) && date(created_at) > '#{params[:created_from_keyword]}')", {:name => "%#{params[:search_keyword]}%", :email => "%#{params[:search_keyword]}%"}).order("id desc")
                           elsif(params[:search_keyword].present? && params[:created_from_keyword].blank? && params[:created_to_keyword].present?)
                              User.where("((name LIKE :name or email LIKE :email) && date(created_at) < '#{params[:created_to_keyword]}')", {:name => "%#{params[:search_keyword]}%", :email => "%#{params[:search_keyword]}%"}).order("id desc")
                           elsif(params [:search_keyword].blank? && params[:created_from_keyword].present? && params[:created_to_keyword].blank?)
                              User.where("date(created_at) > '#{params[:created_from_keyword]}'").order("id desc")
                           elsif(params [:search_keyword].blank? && params[:created_from_keyword].blank? && params[:created_to_keyword].present?)
                              User.where("date(created_at) < '#{params[:created_to_keyword]}'").order("id desc")
                           else
                              User.all
                           end
                         end
    end
  end
end
