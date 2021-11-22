require "streamio-ffmpeg"
require_relative "./config"

VIDEO_FILES.each_with_index do |video, i|
  movie = FFMPEG::Movie.new(Dir.pwd + "/#{DIR_INPUT}/#{video}.mp4")

  puts movie.duration
  puts movie.resolution

  VIDEO_OPTIONS[:resolution].each_with_index do |res, idx|
    options = { resolution: res }
    res_h = res.split('x')
    movie.transcode(Dir.pwd + "/#{DIR_OUTPUT}/#{video}_#{res_h[1]}.mp4", options)
  end
end
