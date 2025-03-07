module Admin
  class AnimalsController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    def update
      alert = alerts_update
      if requested_resource.update(resource_params)
        if alert.present?
          flash[:notice] = alert.join(", ")
        end
        redirect_to(
          after_resource_updated_path(requested_resource)
          )
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }, status: :unprocessable_entity
      end
    end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    def find_resource(id)
      Animal.find(id)
    end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #   if current_user.super_admin?
    #     resource_class
    #   else
    #     resource_class.with_less_stuff
    #   end
    # end

    # Override `resource_params` if you want to transform the submitted
    # data before it's persisted. For example, the following would turn all
    # empty values into nil values. It uses other APIs such as `resource_class`
    # and `dashboard`:
    #
    # def resource_params
    #   params.require(resource_class.model_name.param_key).
    #     permit(dashboard.permitted_attributes(action_name)).
    #     transform_values { |value| value == "" ? nil : value }
    # end

    # See https://administrate-demo.herokuapp.com/customizing_controller_actions
    # for more information
    private
    def alerts_update
      status = find_resource(params[:id]).status
      herd = find_resource(params[:id]).herd.name
      alert = []

      if resource_params[:status] == "sold" and status != "sold"
        alert <<  "Animal #{find_resource(params[:id]).name} was marked as sold"
      end

      if  herd != Herd.find(resource_params[:herd_id]).name
        alert << "Animal #{find_resource(params[:id]).name} was added to #{Herd.find(resource_params[:herd_id]).name} Herd."
      end
      alert
    end

  end
end
