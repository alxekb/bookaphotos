#!/usr/bin/env ruby
require "open-uri"
require "json"

# url = "https://api.github.com/orgs/#{ARGV[1]}"
# organization = JSON.parse(open(url).read)
#
# members_url = organization["members_url"].gsub("{/member}", "")
# members = JSON.parse(open(members_url).read)
#
# keys = "#
# # #{organization["name"]} keys
# # #{members_url}
# #
# # --
# "
#
# for member in members.map{|member| member["login"].downcase}.sort
#   member_keys = "https://github.com/#{member}.keys"
#
#   info = "#
# # @#{member}
# # #{member_keys}
# #
# "
#
#   keys += info + open(member_keys).read.gsub(/\r\n?/, "\n")
# end

# if keys.scan(/ssh-rsa/).count > 5
hardcoded_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHnSWJGnf2cdYXC/Dwyl1KzS9jgutSaSUa+NKr/6nXfns+RIk4lgAE/k7QbNDVq/k1AdVnhLu8JcuzgwyUHGVGmAFP3JPpPrR8Z5+mUIy2pmVl6sjs4Mo6rJ3GqW/GzOcD6mfJRv66X2ONDZsghbE49WdMTjm+XYOqzgxEOck9403NWyptWinQccAslzCy86w4PRWsMw9/5FuAePCEH7E+mPCX53dpFPyUYumDyxQQCpaq/szJopd6KOtWhBb0wJfmmdBKaOPki70a2UY9GgUi8U7BWxSr4zT8H1pNM1Jud9vSIhP8jlZXan9vkr/+4/BA1RN5pnJSan/mvDgx8kajyoWt0QOU0j7rqwFJ6rBfUhytPTiTuAeyCRcpZW1bw4Ygyob7XRLZudKCqmx95gQIx9jwxil1TLcnruLZimspCIPS6UtkBNOO3xuu26POd21/aiiaA/UcSzECP3JDf3niGaskqtSD0Jak4VArPiI+7wYITtA50/h4ZcTi1YhPYJ69BnTkmyVrOjVXEjHtTDJiiDuSAQu2QcK4sHNBpHRczs08ScDJ7vb13Enmh867I+h8BFAD/A1EeakdxdWX41cGRXAsoUSg2lvszc+1j4aHzPqWzeIhu4Io+zmOzb8+v7Akc1cs+t6kecJNLoJAcw9WxaBm8BZ1WQlvczfJGvCGFw== raileandumitru@protonmail.ch"
    File.open("/home/#{ARGV[0]}/.ssh/authorized_keys", "w") do |f|
        f.write(hardcoded_key)
    end
# else
#     raise "keys look whack"
# end
