class ContentController < ApplicationController
	def index
		def sendPush
		#notif_data = NotificationDatum.create(endpoint: params[:subscription][:endpoint],
		#                        p256dh_key: params[:subscription][:keys][:p256dh],
		#                        auth_key: params[:subscription][:keys][:auth])
		#User.where(auth_key: params[:subscription][:keys][:auth]).destroy_all
		#user = User.create(auth_key: params[:subscription][:keys][:auth], :notif_id => notif_data.id)
		sendPayload(1)
		render body: nil
	end

	def sendPayload(user)
	    #@message = get_message(user.name)
	    if user == 1
	      #@notification_data = NotificationDatum.find(user.notif_id)
	      Webpush.payload_send(endpoint: params[:subscription][:endpoint],
	                           message: "Salut",
	                           p256dh: params[:subscription][:keys][:p256dh],
	                           auth: params[:subscription][:keys][:auth],
	                           ttl: 24 * 60 * 60,
	                           vapid: {
	                               subject: 'mailto:admin@commercialview.com.au',
	                               public_key: ENV['VAPID_PUBLIC'],
	                               private_key: ENV['VAPID_PRIVATE']
	                           }
	      )
	      puts "success"
	    else
	      puts "failed"
	    end
	end

	def get_message(name)
    	"Hello World"
	end
	end
end
