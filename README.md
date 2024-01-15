### Ruby version
```
ruby-3.2.2
```

### Rails version
```
Rails 7.0.8
```  

### System dependencies
- ruby version needs to be installed alongside with rails


### How to install
- Ruby and Rails are installed (https://guides.rubyonrails.org/v5.0/getting_started.html)
- Postgres database is configured
- bundle
- change database-example.yml to database.yml
- insert your database credentials inside database.yml
- rails db:create db:migrate
- rails db:seed
- task `daily_disbursement:make_daily_disbursement` can be run daily at 8 UTC either by whenever gem or cron tab


### How to run the test suite
```
rspec spec/
```

### What was done
Within 6 hours I managed to have a job that calculate disbursement daily for weekly / daily merchants. 
Job can be found in `daily_disbursement_job` file.

Created a service `calculate_merchant_disbursement` whose main role is to know wether merchant is daily/weekly and calculate the disbursement accordingly

Created a service `perform_disbursement_calculation` whose main role is to calculate disbursement, taking in orders and storing/calculating fees

Created a service `fill_yearly_disbursement_summary` whose main role is to store yearly summary

Model `disbursement` after create hook store `monthly_fees_given` and also triggers yearly disbursement summary

Development objectives were mainly archieved by using TDD approach. All tests are in file `daily_disbursement_job_spec`

### What is remaining

Calculate monthly fees given and number of fees in yearly summary

Import CSV files for orders and merchants
