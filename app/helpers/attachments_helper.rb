module AttachmentsHelper

  def serve
    @attachment = Attachment.find(params[:id])
    send_data(@attachment.content, 
              :type => @attachment.mime_type,
              :filename => "#{@attachment.filename}",
              :disposition => "inline"
              )
  end

  def download_file
    @attachment = Attachment.find(params[:id])
    send_data(@attachment.content, 
              :type => @attachment.mime_type,
              :filename => "#{@attachment.filename}",
              :disposition => "attachment"
              )
  end

  def view_file
    @attachment = Attachment.find(params[:id])
  end

end
