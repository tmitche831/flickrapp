class PhotosController < ApplicationController
	require 'flickraw'

	def index
		render
	end

	def show
		FlickRaw.api_key = "0436770df28381222f1f8b15aa3dcda8"
		FlickRaw.shared_secret = "8854eb4bb81d798f"

		url = params[:url]
		info = flickr.photos.getInfo(:photo_id => url.split("/").last)
		@embed_photo = {}
		@embed_photo["flickr"]=FlickRaw.url(info) rescue FlickRaw.url_o(info) rescue FlickRaw.url_b(info)
		@title = info.title
		@square_url = FlickRaw.url_s(info)
		@taken = info.dates.taken
		@views = info.views
		@tags = info.tags.map{|t| t.raw}
	end
end
