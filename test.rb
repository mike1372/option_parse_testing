require 'optparse'
require 'ostruct'
require 'pry'

def get_options
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
  puts ARGV # Will only output (unused) arguments if they have not been matched above
  puts "done!"
end

get_options
