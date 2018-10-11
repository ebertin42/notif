class ContentController < ApplicationController
	def index
		def sendPush
		notif_data = NotificationData.create(endpoint: params[:subscription][:endpoint],
		                        p256dh_key: params[:subscription][:keys][:p256dh],
		                        auth_key: params[:subscription][:keys][:auth])
		User.where(auth_key: params[:subscription][:keys][:auth]).destroy_all
		user = User.create(auth_key: params[:subscription][:keys][:auth], :notif_id => notif_data.id)
		sendPayload(user)
		render body: nil
		end

	def sendPayload(user)
	    @message = get_message(user.name)
	    if user.notif_id.present?
	      @notif_data = NotificationData.find(user.notif_id)
		  out = Webpush.payload_send(endpoint: @notif_data.endpoint,
	                           message: "Salut",
	                           p256dh: @notif_data.p256dh_key,
	                           auth: @notif_data.auth_key,
	                           ttl: 24 * 60 * 60,
	                           vapid: {
	                               subject: 'mailto:admin@commercialview.com.au',
	                               public_key: ENV['VAPID_PUBLIC'],
	                               private_key: ENV['VAPID_PRIVATE']
	                           }
	      )
	      puts "success"
		  puts out
	    else
	      puts "failed"
		  puts out
	    end
	end

	def get_message(name)
    	"Hello World"
	end
	end
end
