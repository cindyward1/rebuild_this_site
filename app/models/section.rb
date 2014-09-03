class Section < ActiveRecord::Base

  has_many :lessons
  validates :number, :presence => true, :uniqueness => true
  validates_numericality_of :number, :greater_than_or_equal_to => 1
  validates :name, :presence => true, length: { maximum: 40 }

  def self.all_number_order
    Section.all.order(:number)
  end

  def next
    next_section = []
    next_section = Section.where(:number=>self.number+1)
    if next_section.empty?
      return nil
    else
      return next_section.first
    end
  end

  def previous
    previous_section = []
    previous_section = Section.where(:number=>self.number-1)
    if previous_section.empty?
      return nil
    else
      return previous_section.first
    end
  end

end
