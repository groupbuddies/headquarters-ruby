class Headquarters::Members
  def self.all
    Requests.get_json('/members')
  end
end
