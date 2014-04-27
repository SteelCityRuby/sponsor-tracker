class WelcomeController < ApplicationController
  def index
    @total_invoiced = Invoice.all.map{|i| i.total}.sum
    @total_payments_received = Payment.sum :amount
    @total_invoices_unpaid = @total_invoiced - @total_payments_received

    @payments_by_sponsor = Payment.select('*, sum(amount) as total').group('invoice_id, id').includes(:invoice)
  end

  def about
    adapter = Rails.configuration.database_configuration[Rails.env]['adapter']
    url = Rails.configuration.database_configuration[Rails.env]['url']
    if adapter == 'sqlite3'
      @db_server_version = ActiveRecord::Base.connection.execute('select sqlite_version()')[0][0]
      @db_adapter = "SQLite3"
    elsif adapter == 'postgresql' || /^postgresql/ =~ url
      @db_server_version = ActiveRecord::Base.connection.execute('select version()').first['version']
      @db_adapter = "PostgreSQL"
    else
      @db_adapter = "Database"
      @db_server_version = "unknown"
    end
  end
end
