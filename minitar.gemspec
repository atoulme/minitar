Gem::Specification.new do |s|
  s.name = %{minitar}
  s.version = %{0.5.4}
  s.author = %{Austin Ziegler, Mauricio Fernandez, Antoine Toulme}
  s.email = %{antoine@lunar-ocean.com}
  s.homepage = %{http://www.github.com/atoulme/minitar}
  s.licenses = ['GPL2', 'Ruby']
  #s.rubyforge_project = %{ruwiki}

  s.files = Dir.glob("**/*").delete_if do |item|
    item.include?("CVS") or item.include?(".svn") or
    item == "install.rb" or item =~ /~$/ or
    item =~ /gem(?:spec)?$/
  end

  s.summary = %{Provides POSIX tarchive management from Ruby programs.}
  s.platform = Gem::Platform::RUBY

  s.required_ruby_version = %(>=1.8.2)

  s.executables = %w(minitar)
  s.bindir = %(bin)

  s.test_files = %w{tests/testall.rb}

  s.autorequire = %{archive/tar/minitar}
  s.require_paths = %w{lib}

  description = []
  File.open("README") do |file|
    file.each do |line|
      line.chomp!
      break if line.empty?
      description << "#{line.gsub(/\[\d\]/, '')}"
    end
  end
  s.description = description[2..-1].join(" ")

  s.has_rdoc = true
  s.rdoc_options = ["--title", "Archive::Tar::MiniTar -- A POSIX tarchive library", "--main", "README", "--line-numbers"]
  s.extra_rdoc_files = %w(README ChangeLog Install)
end
