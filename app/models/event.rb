class Event < ActiveRecord::Base
	#validates_presence_of :name
	scope :pub, where( :is_public => true )
    scope :recent_three_days, where(["created_at > ? ", Time.now - 3.days ])
end

Event.create( :name => "public event", :is_public => true )
Event.create( :name => "private event", :is_public => false )
Event.create( :name => "private event", :is_public => true )

#Event.public
#Event.public.recent_three_days


