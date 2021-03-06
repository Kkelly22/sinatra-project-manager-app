class Client < ActiveRecord::Base
  has_many :projects, dependent: :destroy

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Client.all.find{|client| client.slug == slug}
  end
end
