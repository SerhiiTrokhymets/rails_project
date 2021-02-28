module Blog::Helpers::Posts
  def declared_params
    declared(params, include_missing: false)
  end

  def decode
    decode, = JWT.decode params[:token], nil, false
    decode
  end
end
