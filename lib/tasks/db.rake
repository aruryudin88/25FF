namespace :db do
  desc "Seed the database with its private default values."
  task private_seed: :environment do
    require "#{Rails.root}/db/private_seed"
  end

end
