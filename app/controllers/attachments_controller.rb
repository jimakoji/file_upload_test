class AttachmentsController < ApplicationController
  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = Attachment.all
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
    @attachment = Attachment.find(params[:id])
  end

  # GET /attachments/new
  # GET /attachments/new.json
  def new
    @attachment = Attachment.new
  end

  # GET /attachments/1/edit
  def edit
    @attachment = Attachment.find(params[:id])
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(params[:attachment]) do |t|
      if params[:attachment][:content]
        t.content   = params[:attachment][:content].read
        t.size   = params[:attachment][:content].size
        t.filename  = params[:attachment][:content].original_filename
        t.mime_type = params[:attachment][:content].content_type
      end
    end

    if @attachment.save
      redirect_to(@attachment, :notice => 'attachment was successfuly created.')
    else
      render 'new'
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.json
  def update
    @attachment = Attachment.find(params[:id])
    @attachment.name      = params[:attachment][:name]

#    @attachment do |t|
      if params[:attachment][:content]
        @attachment.content   = params[:attachment][:content].read
        @attachment.size   = params[:attachment][:content].size
        @attachment.filename  = params[:attachment][:content].original_filename
        @attachment.mime_type = params[:attachment][:content].content_type
      end
#    end

    if @attachment.save
      redirect_to(@attachment, :notice => 'attachment was successfuly updated.')
    else
      render 'edit'
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    redirect_to attachments_url
  end

end
