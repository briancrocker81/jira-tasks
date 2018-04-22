require_relative 'config.rb'
require 'colorize'

# ToDo make branch call inherit from Class Branch

def merge_to_testing(branch = '')

  if branch.to_s.empty?
    puts 'Enter branch details'.colorize(:yellow)
    branch = gets.chomp
  end

  Kernel::system "git --git-dir=#{$path_repo}/.git --work-tree=#{$path_repo} fetch origin"
  Kernel::system "git --git-dir=#{$path_repo}/.git --work-tree=#{$path_repo} checkout testing"
  Kernel::system "git --git-dir=#{$path_repo}/.git --work-tree=#{$path_repo} reset --hard origin/testing"
  Kernel::system "git --git-dir=#{$path_repo}/.git --work-tree=#{$path_repo} merge --no-ff #{branch}"
  Kernel::system "git --git-dir=#{$path_repo}/.git --work-tree=#{$path_repo} push origin testing"
end

def merge_up(branch)
  branch = branch
  Kernel::system "git --git-dir=#{$path_repo}/.git --work-tree=#{$path_repo} fetch origin"
  Kernel::system "git --git-dir=#{$path_repo}/.git --work-tree=#{$path_repo} checkout #{branch}"
  Kernel::system "git --git-dir=#{$path_repo}/.git --work-tree=#{$path_repo} merge origin/master"

  puts "Merge to testing now?".colorize(:yellow)
  merging = gets.chomp.downcase
  if (merging == 'y')
    merge_to_testing(branch)
  else
    puts 'Bye for now'
  end
end

puts "Has the branch been 'Merged up' recently? Y or N"
merge_status = gets.chomp.downcase

if merge_status == 'y'
  merge_to_testing
else
  puts 'Enter branch details'.colorize(:yellow)
  branch = gets.chomp
  merge_up(branch)
end
