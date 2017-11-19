require "FileUtils"

srcs = File.join(File.expand_path(File.dirname(__FILE__)), "src", "*")

dst = File.expand_path(File.join("~", "Library", "Application Support"))
latest_install = Dir[File.join(dst, 'SketchUp*')].sort.reverse.first
dst_plugins = File.join(latest_install, 'SketchUp', 'Plugins')

Dir[srcs].each do |s|
  dst_file = File.join(dst_plugins, s)
  puts dst_file
  if File.exist?(dst_file)
    puts "can't cp #{s}, #{dst_plugins}"
  else
    puts "cp #{s}, #{dst_plugins}"
    FileUtils.cp_r(s, dst_plugins)
  end
end


