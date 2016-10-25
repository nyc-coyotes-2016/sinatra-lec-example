get '/' do
  @songs = Song.all
  erb :index
end

get '/songs/new' do
  erb :new
end

post '/songs' do
  sinatra = Artist.find_by(last_name: 'Sinatra')
  song = Song.new(title: params['title'], artist: sinatra)
  if(song.save)
    puts 'Created new song'
    redirect '/'
  else
    puts 'Did not create new song'
  end
end
