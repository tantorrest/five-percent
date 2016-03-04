class ProjectController < ApplicationController
  def list
  	@projects = Project.all()
  end

  def index
  	id = params[:id]
  	@project = Project.where(:id => id)[0]
  	@lists = @project.lists
  end

  def add_list
  	@list = List.new
  	@list.title = params[:list][:title]
  	@list.project_id = params[:id]
  	@list.starter = params[:list][:starter]
    @list.date_time = DateTime.now();
  	if @list.save() then
  		redirect_to(:controller => 'project', :action => 'index', id: @list.project_id)
  	end
  end

  def add_comment
  	@comment = Comment.new
  	@comment.text = params[:comment][:text]
  	@comment.name = params[:comment][:name]
  	@comment.list_id = params[:comment][:list_id]
    @comment.date_time = DateTime.now();
    if params[:comment][:file_name] then
        @comment.file_name = params[:comment][:file_name].original_filename
        photo = params[:comment][:file_name]
        File.open(Rails.root.join('app', 'assets', 'images', params[:comment][:file_name].original_filename), 'wb') do |file|
          file.write(photo.read)
        end
    end

  	if @comment.save() then
  		redirect_to(:controller => 'project', :action => 'index', id: params[:id])
  	end
  end

  def add_photo
    if params[:photo] then
      @photo = Photo.new
      @photo.date_time = DateTime.now()
      @photo.user_id = session[:id]
      @photo.file_name = params[:photo][:file_name].original_filename
      uploaded_photo = params[:photo][:file_name]
      File.open(Rails.root.join('app', 'assets', 'images', params[:photo][:file_name].original_filename), 'wb') do |file|
        file.write(uploaded_photo.read)
      end
      if @photo.save then
        redirect_to(:action => "index", id: session[:id])
      end
    else
      flash[:notice] = "Upload file failed. Try again!"
      redirect_to(:action => "new")
    end
  end
end
