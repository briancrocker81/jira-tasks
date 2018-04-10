# require 'rubygems'
# require 'jira-ruby'
require_relative 'config.rb'
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
  attr_accessor :num, :branch_type, :branch_name # Possibility these can be removed after testing

  def initialize(params = {})
    # puts 'Enter branch number'
    # num = gets.chomp
    num = params.fetch(:num)
    validate_num(num)

    # puts 'Enter branch type. \nEnter b for Bug or f for Feature'
    # branch_type = gets.chomp
    branch_type = params.fetch(:branch_type)
    validate_branch_type(branch_type)

    # puts 'Enter branch title'
    # branch_name = gets.chomp
    branch_name = params.fetch(:branch_name)
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
    @branch_type = branch_type
    # @branch_type = branch_type.downcase
    # if @branch_type == 'b' || @branch_type == 'bug'
    #   @branch_type = 'bug'
    # elsif @branch_type == 'f' || @branch_type == 'feature'
    #   @branch_type = 'feature'
    # else
    #   puts "Enter branch type. \nEnter b for Bug or f for Feature"
    #   branch_type = gets.chomp
    #   validate_branch_type(branch_type)
    # end
    self
  end

  def validate_branch_name(branch_name)
    @branch_name = branch_name.to_s.downcase.strip.gsub('/','-').gsub(' ', '-').gsub(/[^\w-]/, '').capitalize
    self
  end

  def process_git
    Kernel::system "git --git-dir=#{$path_repo}/.git --work-tree=#{$path_repo} checkout master"
    Kernel::system "git --git-dir=#{$path_repo}/.git --work-tree=#{$path_repo} fetch origin"
    Kernel::system "git --git-dir=#{$path_repo}/.git --work-tree=#{$path_repo} checkout -b #{@new_branch}"
  end

  def convert
    @new_branch = "#{@branch_type}/FLX-#{@num}-#{@branch_name}"
    process_git
  end

end

b_num = rand(10 ** 4)
lorem = ["wibble","dibble","fibble","bibble","gibble","aibble","sibble","cibble","xibble","tibble","oibble","libble"].sample(4)
bch = ["bug", "feature"].sample

branch = Branch.new(:num => b_num.to_s, :branch_type => bch.to_s, :branch_name => lorem.to_s )
