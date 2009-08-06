# Model without database.
#
# Author:: Patrick Espake (mailto:patrickespake@gmail.com)
# Copyright:: Copyright (c) 2009
# License:: MIT
class TablelessModel < ActiveRecord::Base
  # Returns an array of column objects for the table associated with this class.
  def self.columns
    @columns ||= [];
  end

  # Instantiates a new column in the table.
  #
  # +name+ is the column's name, such as <tt>supplier_id</tt> in <tt>supplier_id int(11)</tt>.
  # +sql_type+ is only used to extract the column's length, if necessary. For example +60+ in <tt>company_name varchar(60)</tt>.
  # +default+ is the type-casted default value, such as +new+ in <tt>sales_stage varchar(20) default 'new'</tt>.
  # +null+ determines if this column allows +NULL+ values.
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  # Override the save method to prevent exceptions.
  def save(validate = true)
    validate ? valid? : true
  end
end