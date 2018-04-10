require 'rubygems'
require 'jira-ruby'
require_relative 'config.rb'
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.

p "processing..."
options = {
    :username => $username,
    :password => $password,
    :site     => $site,
    :context_path => '',
    :auth_type => :basic
}

client = JIRA::Client.new(options)


query_options = {
    :fields => [],
    :start_at => 0,
    :max_results => 100000
}

@issues = ''

$arr = []
client.Issue.jql('project = FLX', query_options).each do |issue|
  $arr.push @issues = "#{@issues} <br> #{issue}"
  puts @issues = "#{@issues} <br> #{issue}"
  #@issues.push(issue.id)
end
# puts @issues = @issues.length
puts $arr.length
