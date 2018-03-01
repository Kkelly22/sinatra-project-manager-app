class ProjectManager < ActiveRecord::Base
  has_many :projects
  has_secure_password

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    ProjectManager.all.find{|pm| pm.slug == slug.downcase.gsub(" ","-")}
  end
end
