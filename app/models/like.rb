class Like < ActiveRecord::Base
	enum target_type: [ :post, :comment ]
end
