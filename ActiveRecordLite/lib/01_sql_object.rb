require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ..
    # query = "select * from #{table_name}"
  return @columns if @columns
  col_query = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{table_name}"
      LIMIT
        1
    SQL

    @columns = col_query[0].map(&:to_sym)
  end

  def self.finalize!
  end

  def self.table_name=(table_name)
    # ...
    table_name = "#{self.to_s.downcase}s"
  end

  def self.table_name
    # ...
    table_name = "#{self.to_s.downcase}s"

  end

  def self.all
    # ...
    kitty = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        "#{table_name}"
    SQL


  end

  def self.parse_all(results)
    # ...
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...

  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
