module User::Operation
  class Signup < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :make!
      step Contract::Build(constant: User::Contract::Signup)
      def make!(options, params:, **)
        options["model"] = User.new()
      end
    end

    step Nested(Present)
    step :assign_current_user!
    step Contract::Validate(key: :user)
    step Contract::Persist()
 
    def assign_current_user!(options, **)
      options["model"].role ||= 1
      options["model"].create_user_id = 1
      options["model"].updated_user_id = 1
    end
  end
end
