require 'optparse'
require 'ostruct'

# Note the syntax required to get the arguments into the program without Rake
# trying to process them is as per the following example:
#
# rake options -- -b my_bucket --profile my_profile
#
# i.e. the -- must be specified to indicate the presence of the options 
#
# Therefore additiona tasks and Rake options must not be interleaved with the
# option switches and arguments

task :options do
	# This line resets the ARGS to nil values so that Rake does not try and process them
	ARGV.each { |a| task a.to_sym do ; end }
	p ARGV
	puts
	# These shifts are needed to get OptionParser to start processing the arguments
	# successfully as they remove any leading arguments orior to reaching the -- argument
	while ARGV.first != '--' do
		ARGV.shift
	end
	ARGV.shift
	
  options = OpenStruct.new
  optparse = OptionParser.new do |opts|
    opts.banner = "Usage: cfn-dsl bootstrap:"
    opts.separator ""
    opts.separator "Available command line override options are as per the following:"

    opts.on("-b", "--bucket ARGUMENT" , "Specify the bucket name") do |b|
	    options.bucket_name = b
	  end

    opts.on("-p", "--profile ARGUMENT", "Specify the AWS profile name") do |p|
      options.aws_profile_name = p
    end

    opts.on("-r", "--region ARGUMENT", "Specify the AWS region") do |r|
      options.aws_region = r
    end

    opts.on_tail("-h", "--help", "This menu") do
      puts opts
      exit(0)
    end
  end

  optparse.parse!

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
