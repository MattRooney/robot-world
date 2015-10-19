class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :birthday,
              :hired,
              :department

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @city = data[:city]
    @state = data[:state]
    @birthday = data[:birthday]
    @hired = data[:hired]
    @department = data[:department]
  end
end
