require "csv"

namespace :csv do
  desc "import all files"
  task :import_all => [:import_customers,
                       :import_merchants,
                       :import_invoices,
                       :import_transactions,
                       :import_items,
                       :import_invoice_items
                      ]

  desc "Import Customer csv"
  task :import_customers => :environment do
    puts "Importing Customers"
    file = "db/data/customers.csv"

    CSV.foreach( file, :headers => true ) do |row|
      Customer.create({
        :first_name => row[1],
        :last_name  => row[2],
        :created_at => row[3],
        :updated_at => row[4]
        })
    end
    puts "Customers Successfully Imported"
  end

  desc "Import Invoice Items csv"
  task :import_invoice_items => :environment do
    puts "Importing Invoice Items"
    file = "db/data/invoice_items.csv"

    CSV.foreach( file, :headers => true ) do |row|
      InvoiceItem.create({
        :item_id    => row[1],
        :invoice_id => row[2],
        :quantity   => row[3],
        :unit_price => row[4],
        :created_at => row[5],
        :updated_at => row[6]
        })
    end
    puts "Invoice Items Successfully Imported"
  end

  desc "Import Invoices csv"
  task :import_invoices => :environment do
    puts "Importing Invoices"
    file = "db/data/invoices.csv"

    CSV.foreach( file, :headers => true ) do |row|
      Invoice.create({
        :customer_id => row[1],
        :merchant_id => row[2],
        :status      => row[3],
        :created_at  => row[4],
        :updated_at  => row[5]
        })
    end
    puts "Invoices Successfully Imported"
  end

  desc "Import Items csv"
  task :import_items => :environment do
    puts "Importing Items"
    file = "db/data/items.csv"

    CSV.foreach( file, :headers => true ) do |row|
      Item.create({
        :name        => row[1],
        :description => row[2],
        :unit_price  => row[3],
        :merchant_id => row[4],
        :created_at  => row[5],
        :updated_at  => row[6]
        })
    end
    puts "Items Successfully Imported"
  end

  desc "Import Merchants csv"
  task :import_merchants => :environment do
    puts "Importing Merchants"
    file = "db/data/merchants.csv"

    CSV.foreach( file, :headers => true ) do |row|
      Merchant.create({
        :name        => row[1],
        :created_at  => row[2],
        :updated_at  => row[3]
        })
    end
    puts "Merchants Successfully Imported"
  end

  desc "Import Transactions csv"
  task :import_transactions => :environment do
    puts "Importing Transactions"
    file = "db/data/transactions.csv"

    CSV.foreach( file, :headers => true ) do |row|
      Transaction.create({
        :invoice_id                  => row[1],
        :credit_card_number          => row[2],
        :credit_card_expiration_date => row[3],
        :result                      => row[4],
        :created_at                  => row[5],
        :updated_at                  => row[6]
        })
    end
    puts "Transactions Successfully Imported"
  end
end
