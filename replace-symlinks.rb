#! /usr/bin/ruby

def replace_symlinks(dir)
        d = Dir.new(dir)
        d.each do |f|
                next if ['.', '..'].include?(f)
                fp = File.join(dir, f)
                if File.directory?(fp)
                        puts "going into '#{fp}'"
                        replace_symlinks(fp)
                elsif File.symlink?(fp)
                        real = File.realpath(f, dir)
                        cmd = ("mv \"#{real}\" \"#{fp}\"")
                        system cmd
                        #puts cmd
                end
        end
end

replace_symlinks(".")
