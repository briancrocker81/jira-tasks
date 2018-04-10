require 'rubygems'
require 'jira-ruby'
require_relative 'config.rb'

options = {
  :username     => $username,
  :password     => $password,
  :site         => $site,
  :context_path => '',
  :auth_type    => :basic
}

client = JIRA::Client.new(options)

# puts client

project = client.Project.find($project)
# project = client.Project.all

# puts project

# developer =

# user = client.User.find('brian.crocker')
# p user.id

def filterusers(assignee)
  arr = []
  assignee.each do |key, val|
    if key == key["key"]
      arr.push val
    end
  end
  puts arr
end

$arr = []
project.issues.each do |issue|
  branch = "#{issue.key} - #{issue.summary}"
  $arr.push branch
  # puts issue.fields.fetch("assignee", "name")
  assignee = issue.fields.fetch("assignee")
  # puts = issue.fields
  # if (assignee.class == Hash)
  #   filterusers(assignee)
  # end
end

puts $arr.length


# def convert(num, title)
#   branch_name  = title.downcase.strip.gsub('/','-').gsub(' ', '-').gsub(/[^\w-]/, '').capitalize
#   puts "feature/FLX-#{num}-#{branch_name}"
# end
#
# puts 'Enter branch number'
# num = gets.chomp
#
# puts 'Enter branch title'
# text = gets.chomp
# convert(num, text)
