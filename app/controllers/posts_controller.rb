
class PostsController < ApplicationController
before_filter :authenticate_user!,  :only => [:create, :new, :destroy, :edit]

	def new
	  @post = Post.new
	end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end


	def create
		@post = Post.new(params[:post])
		@post.user_id = current_user.id

		respond_to do |format|
		  if @post.save
		    format.html { redirect_to @post, notice: 'Post was successfully created.' }
		    format.json { render json: @post, status: :created, location: @post }
		  else
		    format.html { render action: "new" }
		    format.json { render json: @post.errors, status: :unprocessable_entity }
		  end
		end
	end

	def index
	  @posts = Post.all
	 
	  respond_to do |format|
	    format.html  # index.html.erb
	    format.json  { render :json => @posts }
	  end
	end



end
