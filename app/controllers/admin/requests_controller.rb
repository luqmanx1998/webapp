class Admin::RequestsController < Admin::MainController
  def index
    @data = Request
    @datas = Request.all.order('created_at ASC')
  end
end
