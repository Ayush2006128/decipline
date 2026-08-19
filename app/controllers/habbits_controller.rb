class HabbitsController < ApplicationController
  before_action :set_habbit, only: %i[ show edit update destroy ]

  # GET /habbits or /habbits.json
  def index
    @habbits = Current.user.habbits.order(due_date: :asc)
  end

  # GET /habbits/1 or /habbits/1.json
  def show
  end

  # GET /habbits/new
  def new
    @habbit = Current.user.habbits.build
  end

  # GET /habbits/1/edit
  def edit
  end

  # POST /habbits or /habbits.json
  def create
    @habbit = Current.user.habbits.build(habbit_params)

    respond_to do |format|
      if @habbit.save
        format.html { redirect_to @habbit, notice: "Habbit was successfully created." }
        format.json { render :show, status: :created, location: @habbit }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @habbit.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /habbits/1 or /habbits/1.json
  def update
    respond_to do |format|
      if @habbit.update(habbit_params)
        format.html { redirect_to @habbit, notice: "Habbit was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @habbit }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @habbit.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /habbits/1 or /habbits/1.json
  def destroy
    @habbit.destroy!

    respond_to do |format|
      format.html { redirect_to habbits_path, notice: "Habbit was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habbit
      @habbit = Current.user.habbits.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def habbit_params
      params.expect(habbit: [ :description, :completion_status, :due_date ])
    end
end
