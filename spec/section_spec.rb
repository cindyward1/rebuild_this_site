require "spec_helper"

describe Section do

  it { should have_many :lessons }
  it { should validate_presence_of :number }
  it { should validate_uniqueness_of :number }
  it { should validate_presence_of :name }
  it { should ensure_length_of(:name).is_at_most(40)}

  context '#next' do
    it 'returns the section with the next-highest number than the current section' do
      current_section = Section.create({:name => 'section1', :number => 1})
      next_section = Section.create({:name => 'section2', :number => 2})
      expect(current_section.next).to eq next_section
    end
  end

  context '#previous' do
    it 'returns the section with the next-lowest number than the current section' do
      previous_section = Section.create({:name => 'section1', :number => 1})
      current_section = Section.create({:name => 'section2', :number => 2})
      expect(current_section.previous).to eq previous_section
    end
  end

end
