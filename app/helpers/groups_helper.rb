module GroupsHelper
#["open","fix","verify","close","suggest"] "#{$post_status[0]}" %>
  def post_status_filter(post_ori, status)
  	i = 0 ; post_return = []
  	post_ori.each do |post|
  		if post.status == "#{status}"
  			post_return[i] = post
  			i += 1
  		end
  	end
  	return post_return
  end

end
