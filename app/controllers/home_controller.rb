class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def write
    
    post = Post.new
    post.title = params[:title]
    post.email = params[:email]
    post.content = params[:content]
    
    mg_client = Mailgun::Client.new("key-10c7b2f6eddecb0a954d3cece47d2963")

    message_params =  {
                       from: 'rimtest@example.com',
                       to:   post.email,
                       subject: post.title,
                       text:    post.content
                       }
    
    result = mg_client.send_message('mailgun.lab.com', message_params).to_h!
    
    message_id = result['id']
    message = result['message']
    
    post.save
    
  end
  
  def mailbox
    @posts = Post.all.reverse
  end
  
  def detail
    @one_post = Post.find(params[:p_id])

  end
  
  def destroy
    one_post = Post.find(params[:p_id])
    one_post.destroy
    redirect_to '/mailbox'
  end
  
end
