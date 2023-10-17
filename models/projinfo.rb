require "open3"
require "etc"
require "json"
class Projinfo
  def initialize()
  end

  def main
    cmd = "projinfo -r Alvis"
    stdout_str, stderr_str, status = Open3.capture3(cmd)
    #fh = File.read("/tmp/projinfo.json")
    projects = JSON.parse(fh)
    target = Etc.getpwuid.name
    user_projects = projects.select do |project|
      project["users"].any? { |user| user["username"] == target }
    end
    return user_projects
  end
end

pi = Projinfo.new();
