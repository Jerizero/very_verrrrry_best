class Api::V1::VerybestsController < Api::V1::GraphitiController
  def index
    verybests = VerybestResource.all(params)
    respond_with(verybests)
  end

  def show
    verybest = VerybestResource.find(params)
    respond_with(verybest)
  end

  def create
    verybest = VerybestResource.build(params)

    if verybest.save
      render jsonapi: verybest, status: 201
    else
      render jsonapi_errors: verybest
    end
  end

  def update
    verybest = VerybestResource.find(params)

    if verybest.update_attributes
      render jsonapi: verybest
    else
      render jsonapi_errors: verybest
    end
  end

  def destroy
    verybest = VerybestResource.find(params)

    if verybest.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: verybest
    end
  end
end
