class ApplicationController < ActionController::Base
  before_action :set_search
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  def set_search
    @q = Tag.ransack(params[:q])
    @results = @q.result
    # 検索でヒットした投稿のidを配列に入れる
    @post_id = []
    @results.each do |a|
      @post_id.push(a.post_id)
    end
    # 重複している投稿idを消し、降順にソートする
    @post_id = @post_id.uniq.sort.reverse
    # ソートされた投稿idを使用して投稿を取得し配列に入れる
    @post = @post_id.map { |id| Post.find(id) }
  end
end
