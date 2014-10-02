class PhotosController < ApplicationController
	require 'flickraw'

	def index
		# https://github.com/hanklords/flickraw
		FlickRaw.api_key="ac2666e61447397277d2cc9e75652f7b"
		FlickRaw.shared_secret="22a4cfc651335bd8"
		@photos = flickr.interestingness.getList( :per_page => 5 )

		@photos.each do |pic|
			photos_info = flickr.photos.getInfo(:photo_id => pic.id)
			photo_url = FlickRaw.url_m(photos_info)
			puts "You can find this photo at #{photo_url}"
			puts "---------------------------------------"
			puts "#{photos_info}"
		end
	end

	def show

	
	end
end
