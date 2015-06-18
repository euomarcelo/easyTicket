class UserReport < Dossier::Report

  def sql
    "SELECT #{columns} FROM users"
  end

  def self.valid_columns
    %w[id username email password]
  end

  def columns
    valid_columns.join(', ').presence || '*'
  end

  def valid_columns
    self.class.valid_columns & Array.wrap(options[:columns])
  end

end
