class MyListsController < ApplicationController
  before_action :set_my_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /my_lists
  # GET /my_lists.json
  def index
    @my_lists = MyList.all
  end

  # GET /my_lists/1
  # GET /my_lists/1.json
  def show
  end

  # GET /my_lists/new
  def new
    @my_list = current_user.my_lists.build
  end

  # GET /my_lists/1/edit
  def edit
  end

  # POST /my_lists
  # POST /my_lists.json
  def create
    @my_list = current_user.my_lists.build(my_list_params)

    respond_to do |format|
      if @my_list.save
        format.html { redirect_to @my_list, notice: 'My list was successfully created.' }
        format.json { render :show, status: :created, location: @my_list }
      else
        format.html { render :new }
        format.json { render json: @my_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_lists/1
  # PATCH/PUT /my_lists/1.json
  def update
    respond_to do |format|
      if @my_list.update(my_list_params)
        format.html { redirect_to @my_list, notice: 'My list was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_list }
      else
        format.html { render :edit }
        format.json { render json: @my_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_lists/1
  # DELETE /my_lists/1.json
  def destroy
    @my_list.destroy
    respond_to do |format|
      format.html { redirect_to my_lists_url, notice: 'My list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def correct_user
    @my_list = current_user.my_lists.find_by(id: params[:id])
    redirect_to my_lists_path, notice: "You don't have permission" if @my_list.nil?
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_list
      @my_list = MyList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_list_params
      params.require(:my_list).permit(:name)
    end

  end
