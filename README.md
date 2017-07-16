#to setup in a local environemt please follow these steps:

1. https://console.developers.google.com
2. Search google drive api
3. Click enable and click on credentails
4. Choose service account 
5. Download the json file in lib in project directory named it as client2.json
6. go to project directory
7. run bundle install
8. run rails db:migrate
9. run rails s in one terminal
10. run rails jobs:work
11. Go to browser and you can follow the same instructions like youtube video.

#Comments & Future Scope
1. If you want to create your own spreadsheet programatically you can find it in lib/quickstart.rb using google's gem

2. You need to provide permission to the email present in your credentials json.

3. Also you can create spreadsheet and provide access to the email present in credentials.

4. I have used Delayed jobs for processing everything in background

5. For pulling the data from google spreadsheet, currently I am calling the delayed job in index method in else part only. However it is not effective but will work for the current design and available resources. If I would have few resources(FREE as heroku free workers are not relialble everytime) available I could have created CRON job to do the database update.

6. Also for front-end I could have use some sort of auto refresh every 5 seconds for the particular div which will not call database update method everytime(Mood.delay.perform). 

7. Also the form part can be converted by using react components. 

References Used:
1. https://www.pluralsight.com/guides/ruby-ruby-on-rails/building-a-crud-interface-with-react-and-ruby-on-rails

2. https://github.com/reactjs/react-rails

3. https://www.nopio.com/blog/react-rails-part-1-tutorial/

4. https://www.twilio.com/blog/2017/03/google-spreadsheets-ruby.html 

