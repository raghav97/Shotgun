desc 'run the rake task'
task run_task: :environment do
  Product.rake_task
end