module User::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: User::Contract::Create)
    end
    step Nested(Present)
    step :assign_current_user!
    step Contract::Validate(key: :user)
    step Contract::Persist()

    def assign_current_user!(options, params:, **)
        options['model'][:dob] = params[:user][:dob]
        options[:params][:user][:create_user_id] = options['current_user'][:id]
        options[:params][:user][:updated_user_id] = options['current_user'][:id]
    end
  end
end
