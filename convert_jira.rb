# require 'rubygems'
# require 'jira-ruby'
# require_relative 'config.rb'
#
# options = {
#   :username     => $username,
#   :password     => $password,
#   :site         => $site,
#   :context_path => '',
#   :auth_type    => :basic
# }
#
# client = JIRA::Client.new(options)
#
# # puts client
#
# project = client.Project.find($project)
# # project = client.Project.all
#
# # puts project
#
# # developer =
#
# # user = client.User.find('brian.crocker')
# # p user.id
#
# def filterusers(assignee)
#   arr = []
#   assignee.each do |key, val|
#     if key == key["key"]
#       arr.push val
#     end
#   end
#   puts arr
# end
#
# $arr = []
# project.issues.each do |issue|
#   branch = "#{issue.key} - #{issue.summary}"
#   $arr.push branch
#   # puts issue.fields.fetch("assignee", "name")
#   assignee = issue.fields.fetch("assignee")
#   # puts = issue.fields
#   # if (assignee.class == Hash)
#   #   filterusers(assignee)
#   # end
# end
#
# puts $arr.length
class Branch

  def initialize()
    puts 'Enter branch number'
    num = gets.chomp
    validate_num(num)

    puts 'Enter branch type. \nEnter b for Bug or f for Feature'
    branch_type = gets.chomp
    validate_branch_type(branch_type)

    puts 'Enter branch title'
    branch_name = gets.chomp
    validate_branch_name(branch_name)

    convert
  end

  def validate_num(num)
    @num = num
    # unless @num.is_a?(Integer)
    #   puts "Please enter 4 digits only #{@num.class}"
    #   num = gets.chomp
    #   validate_num(num)
    # end
    self
  end

  def validate_branch_type(branch_type)
    @branch_type = branch_type.downcase
    if @branch_type == 'b' || @branch_type == 'bug'
      @branch_type = 'bug'
    elsif @branch_type == 'f' || @branch_type == 'feature'
      @branch_type = 'feature'
    else
      puts 'Enter branch type. \nEnter b for Bug or f for Feature'
      branch_type = gets.chomp
      validate_branch_type(branch_type)
    end
    self
  end

  def validate_branch_name(branch_name)
    @branch_name = branch_name.downcase.strip.gsub('/','-').gsub(' ', '-').gsub(/[^\w-]/, '').capitalize
    self
  end

  def convert
    puts "#{@branch_type}/FLX-#{@num}-#{@branch_name}"
  end

end
branch = Branch.new
