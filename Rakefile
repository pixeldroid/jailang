# encoding: utf-8

require 'json'
require 'pathname'
require 'rake/clean'
require 'yaml'

EXIT_OK = 0
PROJECT = 'jailang'
PROJECT_ROOT = File.dirname(__FILE__)


def exec_with_echo(cmd)
  puts(cmd)
  stdout = %x[#{cmd}]
  puts(stdout) unless stdout.empty?
  $?.exitstatus
end

def fail(message)
  abort("‼ #{message}")
end

def try(cmd, failure_message)
  fail(failure_message) if (exec_with_echo(cmd) != EXIT_OK)
end

def read_yaml(file)
  File.file?(file) ? YAML.load(File.read(file)) : {}
end

def write_yaml(file, config)
  IO.write(file, config.to_yaml)
end

def relative_path(source, target)
  Pathname(target).relative_path_from(Pathname(source)).to_s
end


def docs_dir
  File.join(PROJECT_ROOT, 'docs')
end

def jekyll_cmd(verb)
  "bundle exec jekyll #{verb} --source #{docs_dir} --layouts #{docs_dir}/_layouts"
end

def jekyll_build
  jekyll_cmd('build')
end

def jekyll_watch
  jekyll_cmd('serve --watch --incremental')
end

def project_config_file
  File.join(docs_dir, '_config.yml')
end

def project_version
  config = read_yaml(project_config_file)
  config['project']['version']
end

def update_project_version(config_file, new_value)
  # update config and write to file
  config = read_yaml(config_file)
  config['project']['version'] = new_value
  write_yaml(config_file, config)
end


[
  # no files to clean .. yet
].each { |f| CLEAN.include(f) }
Rake::Task[:clean].clear_comments()
Rake::Task[:clean].add_description([
  "removes intermediate files to ensure a clean build",
  "running now would delete the following:\n  #{CLEAN.resolve.join("\n  ")}",
].join("\n"))

[
  '_site',
].each { |f| CLOBBER.include(f) }
Rake::Task[:clobber].clear_comments()
Rake::Task[:clobber].add_description([
  "removes all generated artifacts to restore project to checkout-like state",
  "removes the following folders:\n  #{CLOBBER.join("\n  ")}",
].join("\n"))


task :default => [:list_targets]

task :list_targets do |t, args|
  a = "#{PROJECT} v#{project_version} Rakefile"
  b = "running on Ruby #{RUBY_VERSION}"
  puts "#{a} #{b}"
  system('rake -T')
end


desc [
  "calls jekyll to generate, serve, watch and regenerate the docs site",
  "  cmd: #{jekyll_watch}",
].join("\n")
task :docs do |t, args|
  begin                 # run jekyll
    puts jekyll_watch
    system(jekyll_watch)
  rescue Exception => e # capture interrupt signal from the process
    puts ' (stop)'
  end
end

desc [
  "reports project version",
].join("\n")
task :version do |t, args|
  puts "#{PROJECT} v#{project_version}"
end

desc [
  "updates the project version number",
  "(this is reflected in the generated docs footer)",
  "changes the following files:",
  " '#{relative_path(Pathname.pwd, project_config_file)}'",
].join("\n")
task :set_version, [:v] do |t, args|
  args.with_defaults(:v => nil)
  fail('please provide a version string') unless (args.v && args.v.length > 0)

  update_project_version(project_config_file, args.v)

  puts "[#{t.name}] task completed, #{PROJECT} updated to #{project_version}"
end
