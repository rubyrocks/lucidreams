class DreamsController < ApplicationController
  before_filter :login_required

  # GET /dreams
  # GET /dreams.xml
  def index
    @dreams = Dream.order("id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dreams }
    end
  end

  # GET /dreams/1
  # GET /dreams/1.xml
  def show
    @dream = Dream.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dream }
    end
  end

  # GET /dreams/new
  # GET /dreams/new.xml
  def new
    @dream = Dream.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dream }
    end
  end

  # GET /dreams/1/edit
  def edit
    @dream = Dream.find(params[:id])
  end

  def create
	@dream = Dream.new(params[:dream])

        respond_to do |format|
          if @dream.save
             format.html { redirect_to(dreams_url) }
             format.xml  { head :ok }
	  else
             format.html { redirect_to(dreams_url) }
          end
        end
  end


  # PUT /dreams/1
  # PUT /dreams/1.xml
  def update
    @dream = Dream.find(params[:id])

    respond_to do |format|
      if @dream.update_attributes(params[:dream])
        format.html { redirect_to(@dream, :notice => 'Dream was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dream.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /dreams/1
  # DELETE /dreams/1.xml
  def destroy
    @dream = Dream.find(params[:id])
    @dream.destroy

    respond_to do |format|
      format.html { redirect_to(dreams_url) }
      format.xml  { head :ok }
    end
  end

  def find
    @dreams = Dreams.find(:all, :conditions=>["dream like ?", params[:search_string]])
  end

end
