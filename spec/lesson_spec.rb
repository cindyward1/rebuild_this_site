require "spec_helper"

describe Lesson do

  it { should belong_to :section }
  it { should validate_presence_of :number }
  it { should validate_uniqueness_of :number }
  it { should validate_presence_of :name }
  it { should ensure_length_of(:name).is_at_most(40)}

  context '#next' do
    it 'returns the lesson with the next-highest number than the current lesson' do
      current_lesson = Lesson.create({:name => 'lesson1', :number => 1, :section_id => 1})
      next_lesson = Lesson.create({:name => 'lesson2', :number => 2, :section_id => 1})
      expect(current_lesson.next).to eq next_lesson
    end
  end

  context '#previous' do
    it 'returns the lesson with the next-lowest number than the current lesson' do
      previous_lesson = Lesson.create({:name => 'lesson1', :number => 1, :section_id => 1})
      current_lesson = Lesson.create({:name => 'lesson2', :number => 2, :section_id => 1})
      expect(current_lesson.previous).to eq previous_lesson
    end
  end

end
