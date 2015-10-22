require 'optparse'
require 'ostruct'
require 'pry'

# Note the syntax required to get the arguments into the program without Rake
# trying to process them is as per the following example:
#
# rake options -- '-b=my_bucket' '--profile=my_profile'
#
# i.e. the -- must be specified to indicate the presence of the options and the option
# switches with their respective values must be quoted and the assignment operator needs
# to be used between the switch and its value
#
# If specifying additional rake options they ened to be specified prior to the --
# Additional rake tasks can be placed eithert side of the 'options' options

task :options do
	p ARGV
	puts
	# These shifts are needed to get OptionParser to start processing the arguments
	# successfully as they remove any leading arguments orior to reaching the -- argument
	while ARGV.first != '--' do
		ARGV.shift
	end
	ARGV.shift
	
  options = OpenStruct.new
  OptionParser.new do |opts|
    opts.banner = "Usage: cfn-dsl bootstrap:"
    opts.separator ""
    opts.separator "Available command line override options are as per the following:"

    opts.on("-bARG", "--bucket=ARG" , "Specify the bucket name") do |b|
	    options.bucket_name = b
	  end

    opts.on("-pARG", "--profile=ARG", "Specify the AWS profile name") do |p|
      options.aws_profile_name = p
    end

    opts.on("-rARG", "--region=ARG", "Specify the AWS region") do |r|
      options.aws_region = r
    end

    opts.on_tail("-h", "--help", "This menu") do
      puts opts
      exit(0)
    end

  end.parse!

  puts options
  p ARGV # Will only output (unused) arguments if they have not been matched above
  puts "options parsing done!"
end

task :testing do
	puts "test task executed successfully"
end

task :testing2 do
	puts "test task 2 executed successfully"
end
