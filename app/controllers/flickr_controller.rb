class FlickrController < ApplicationController
	require 'flickraw'

	def index
		
		FlickRaw.api_key = "0436770df28381222f1f8b15aa3dcda8"
		FlickRaw.shared_secret = "8854eb4bb81d798f"

		list = flickr.photos.getRecent

		id = list[0].id
		secret = list[0].secret
		info = flickr.photos.getInfo :photo_id => id, :secret => secret 

		sizes = flickr.photos.getSizes :photo_id => id

		original = sizes.find { |s| s.label == 'Original' }
		# puts original.height
		# puts original.width
	end

	def show
	end
end
