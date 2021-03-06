class WelcomeController < ApplicationController
  def index
    @invoices = Invoice.order(created_at: :desc).to_a
    @total_invoiced = @invoices.map {|i| i.total}.sum
    @total_payments_received = Payment.sum :amount
    @total_invoices_unpaid = @total_invoiced - @total_payments_received

    @payments = Payment.includes(invoice: :sponsor).order(created_at: :desc)
    @open_invoices = @invoices.select {|i| i.balance > 0}
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
