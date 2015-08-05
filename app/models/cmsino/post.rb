class Cmsino::Post < Cmsino::Content
  validates_presence_of :umbrella
  validates_presence_of :name

  before_save :set_date

  def set_date
    self.date = Time.now
  end
end
