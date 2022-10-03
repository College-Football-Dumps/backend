class TeamDefense
  attr_reader :name, :total_havoc, :defensive_line_havoc, :db_havoc

  def initialize(data)
    @name = data[:team]
    @total_havoc = data[:defense][:havoc][:total]
    @defensive_line_havoc = data[:defense][:havoc][:frontSeven]
    @db_havoc = data[:defense][:havoc][:db]
  end
  
end