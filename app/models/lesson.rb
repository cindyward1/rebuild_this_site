class Lesson < ActiveRecord::Base
  scope :all_number_order, -> { Lesson.all.order(:number) }

  belongs_to :section
  validates :number, :presence => true, :uniqueness => true
  validates_numericality_of :number, :greater_than_or_equal_to => 1
  validates :name, :presence => true, length: { maximum: 40 }
  validates :section_id, :presence => true

  def next
    next_lesson = []
    next_lesson = Lesson.where(:number=>self.number+1)
    if next_lesson.empty?
      return nil
    else
      return next_lesson.first
    end
  end

  def previous
    previous_lesson = []
    previous_lesson = Lesson.where(:number=>self.number-1)
    if previous_lesson.empty?
      return nil
    else
      return previous_lesson.first
    end
  end

end
