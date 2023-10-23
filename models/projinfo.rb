require "open3"
require "etc"
require "json"
class Projinfo
  def initialize()
  end

  def main
    cmd = "/usr/local/bin/projinfo -r Alvis --json"
    data, stderr_str, status = Open3.capture3(cmd)
    projects = JSON.parse(data)
    target = Etc.getpwuid.name
    user_projects = projects.select do |project|
      project["users"].any? { |user| user["username"] == target }
    end
    return user_projects
  end
end

pi = Projinfo.new();
