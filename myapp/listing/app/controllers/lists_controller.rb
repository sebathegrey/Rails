class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /lists
  # GET /lists.json
  def index

    $globalid = params.require(:my_list_id)
    @lists = List.where(:my_list_id => $globalid)
    @head_name = MyList.find_by_id($globalid.to_i).name
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new

   @list = List.new
   @list.my_list= MyList.find_by_id($globalid.to_i)
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create

    @list = List.new(list_params)
    @list.my_list= MyList.find_by_id($globalid.to_i)

    respond_to do |format|
      if @list.save
        ActionCable.server.broadcast 'live_channel', description: @list.description, done: @list.done
        
        format.html { redirect_to lists_url(:my_list_id => $globalid), notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url(:my_list_id => $globalid), notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:description, :done, :list_id)
    end
  end
