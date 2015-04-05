require 'lifx'
client = LIFX::Client.lan
client.discover! do |c|
	c.lights.with_label('Lux Aeterna')
end
lux = client.lights.with_label('Lux Aeterna')
last = ""
ARGF.each_line do |a|
   rgb = a.split(" ")
   if a != last then
   	last = a
   	lux.set_color LIFX::Color.rgb(rgb[0].to_i, rgb[1].to_i, rgb[2].to_i), duration: 0
   end
end

