class ForumsController < ApplicationController
  before_action :set_forum, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /forums or /forums.json
  def index
    @forums = Forum.all 
  end

  # GET /forums/1 or /forums/1.json
  def show
    @post = current_user.posts.build

  end

  # GET /forums/new
  def new
    @forum = Forum.new
  end

  # GET /forums/1/edit
  def edit
  end

  # POST /forums or /forums.json
  def create
    @forum = Forum.new(forum_params)
    @forum.creator_id = current_user._id
    @forum.users << current_user


    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: "Forum was successfully created." }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1 or /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: "Forum was successfully updated." }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1 or /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url, notice: "Forum was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def new_post
    # post = current_user.posts.build(post_params)
    
    @post = current_user.posts.build(post_params)
    byebug

    #@post.forum = @forum
    
    
    respond_to do |format|
      if @post.save 
        format.js
      else
        format.html { redirect_to Forum.find(@post.forum_id) }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
      @posts = @forum.posts
      @post = Post.new
    end

    # Only allow a list of trusted parameters through.
    def forum_params
      params.require(:forum).permit(:title, :description)
    end
end
