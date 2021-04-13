require 'csv'
require 'activerecord-import'
namespace :user do
  desc 'TODO'
  task import: :environment do
    items = []
    name_file = 'file.csv'
    CSV.foreach(name_file, headers: true) do |row|
      items << row.to_h
    end
  end

  desc 'TODO'
  task export: :environment do
    name_file = 'file.csv'
    CSV.open(name_file, 'wb') do |csv|
      csv << User.all.first.attributes.map { |a,v| a }
      User.all.each do |s|
        csv << s.attributes.map { |a,v| v }
      end
    end
  end
end
