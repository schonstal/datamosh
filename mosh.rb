require 'aviglitch'

video = AviGlitch.open 'video.avi'
pframes = []
iframes = []

length = video.frames.size

video.frames.each_with_index do |frame, index|
  pframes.push(index) if frame.is_pframe?
  iframes.push(index) if frame.is_iframe?
end

result = video.frames[0, 48]

20.times do
  result.concat(video.frames[49, 1])
end

outfile = AviGlitch.open result
outfile.output 'datamosh.avi'
