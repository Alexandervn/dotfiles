require 'rake'

def colorize(text, color_code)
  "\e[00;#{color_code}m#{text}\e[00m"
end

def red(text); colorize(text, "31"); end
def green(text); colorize(text, "32"); end

def symlink(src, target)
  if ((File.exists? target) && (File.symlink? target))
    if (File.readlink(target) == src)
      puts green("Symlink already exists: " + target)
    else
      print "Overwrite existing symlink '#{target}'? (y/n) "
      case STDIN.gets.chomp
      when 'y'
        do_symlink!(src, target)
      end
    end
  else
    do_symlink(src, target)
  end
end

def do_symlink!(src, target)
  FileUtils.rm target
  do_symlink(src, target)
end

def do_symlink(src, target)
  FileUtils.ln_s(src, target)
  puts green("Created symlink: #{target}")
end

desc "Create symlinks to dotfiles in homedir"
task :symlinks do
  includes = ['vimrc', 'gvimrc', 'gitignore', 'vim', 'bin', 'tmux.conf']
  excludes = []

  includes.each do |file|
    src     = File.join(ENV['PWD'], file)
    target  = File.join(ENV['HOME'], ".#{file}")

    if (file == 'bin')
      target  = File.join(ENV['HOME'], "#{file}")
    end

    if ((File.exists? target) && (!File.symlink? target))
      excludes.push(target)
    end
  end

  if !excludes.empty?
    puts "Please backup or remove the following existing files or directories first:"
    excludes.each do |exclude|
      puts " - " + red(exclude)
    end
  else
    includes.each do |file|
      src     = File.join(ENV['PWD'], file)
      target  = File.join(ENV['HOME'], ".#{file}")

      if (file == 'bin')
        target  = File.join(ENV['HOME'], "#{file}")
      end

      symlink(src, target)
    end
    puts "Done!"
  end
end
