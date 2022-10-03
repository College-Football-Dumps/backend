class TeamDefense
  attr_reader :name, :total_havoc

  def initialize(data)
    @name = data[:team]
    @total_havoc = data[:defense][:havoc][:total]
  end
  
end