class PhotosController < ApplicationController
	require 'flickraw'

	def index
		# https://github.com/hanklords/flickraw
		FlickRaw.api_key="0436770df28381222f1f8b15aa3dcda8"
		FlickRaw.shared_secret="8854eb4bb81d798f"
		@photos = flickr.interestingness.getList( :per_page => 5 )

		@photos.each do |pic|
			photos_info = flickr.photos.getInfo(:photo_id => pic.id)
			photo_url = FlickRaw.url_m(photos_info)
			puts "You can find this photo at #{photo_url}"
		end
	end

	def show

	
	end
end
