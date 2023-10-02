require "open3"
require "etc"
require "json"
class ProjInfo
  def initialize()
  end

  def main
    fh = File.read("/tmp/projinfo.json")
    projects = JSON.parse(fh)
    target = Etc.getpwuid.name
    user_projects = projects.select do |project|
      project["users"].any? { |user| user["username"] == target }
    end
    return user_projects
  end
end
