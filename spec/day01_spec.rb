class Day01 < Helper
  def self.part1
    pp read_file
    binding.pry
    3
  end

  def self.part2
    3
  end
end

RSpec.describe "Day01" do
  it "does part 1" do
    expect(Day01.part1).to eq(3)
  end

  it "does part 2" do
    expect(Day01.part2).to eq(3)
  end
end