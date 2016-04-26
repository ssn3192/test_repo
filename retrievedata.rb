require 'mongo'
require 'csv'

url_for_mongo ='mongodb://heroku_7mw1rrgk:t5oc9fobb1bbejc2ijundejd42@ds019491.mlab.com:19491/heroku_7mw1rrgk'

begin
#retrieving data..!!!
    client = Mongo::Client.new([ 'ds019491.mlab.com:19491' ],:database =>'heroku_7mw1rrgk',:user=>'heroku_7mw1rrgk',:password=>'t5oc9fobb1bbejc2ijundejd42');   
    data = client.database
    college=data.collection('hosiptalrecord')
    puts "data have been retrieved"
    result = college.find()
    puts "Provider ID | Provider Name | Provider Address | City | State | Zip Code | Hospital Referral Region Description | DRG Definition"              
    result.each do |document|
  	puts "#{document['pid']} | #{document['pname']} | #{document['paddr']} | #{document['pcity']} | #{document['pstate']} | #{document['pzip']} | #{document['pdescription']} | #{document['drugdesc']}" 
	
    end
end
