class Link < ActiveRecord::Base
  before_save :create_short_code

  private
  def create_short_code
    self.short_code = (('a'..'z').to_a + ('1'..'10').to_a).sample(5).join
  end
end
