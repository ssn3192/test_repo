require 'mongo'
require 'csv'

class MaincontrollerController < ApplicationController
  def output
    client = Mongo::Client.new([ 'ds019491.mlab.com:19491' ],:database =>'heroku_7mw1rrgk',:user=>'heroku_7mw1rrgk',:password=>'t5oc9fobb1bbejc2ijundejd42');   
    data = client.database
    college=data.collection('hosiptalrecord')
    puts "Retrieve successful"
    @result = college.find(:pid => params[:i])
   # puts "Provider ID | Provider Name | Provider Address | City | State | Zip Code | Hospital Referral Region Description | DRG Definition"
    @result.each do |document|

    puts "#{document['pid']} -- #{document['pname']} -- #{document['paddr']} -- #{document['pcity']} -- #{document['pstate']} -- #{document['pzip']} -- #{document['pdescription']} -- #{document['drugdesc']}"
    end
	render json: @result
end
end
