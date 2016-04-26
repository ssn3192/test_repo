require 'mongo'
require 'csv'

url_for_mongo ='mongodb://heroku_7mw1rrgk:t5oc9fobb1bbejc2ijundejd42@ds019491.mlab.com:19491/heroku_7mw1rrgk'

begin
    #Connection to mongodb
    client = Mongo::Client.new([ 'ds019491.mlab.com:19491' ],:database =>'heroku_7mw1rrgk',:user=>'heroku_7mw1rrgk',:password=>'t5oc9fobb1bbejc2ijundejd42');  
    puts "Connected to mongo database"
    data = client.database
    data.collection_names.each{|name| puts name }
        college=data.collection('hosiptalrecord')
        
    CSV.foreach('datahosiptal.csv', :headers => true) do |csv_obj|
               result=college.insert_one({ :pid => csv_obj['ProviderID'], :pname => csv_obj['ProviderName'], :paddr => csv_obj['ProviderAddress'], :pcity => csv_obj['City'], :pstate => csv_obj['State'], :pzip => csv_obj['ZipCode'], :pdescription => csv_obj['Hospital Referral Region Description'], :drugdesc => csv_obj['DRG Definition']})
                
        end    
        puts "Data Inserted"

end
