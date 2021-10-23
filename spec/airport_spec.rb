require "airport"

describe Airport do
  let(:weather_su) { double(:weather_su, :weather => :sunny) }
  let(:weather_st) { double(:weather_st, :weather => :stormy) }

  it { should respond_to(:check_weather) }

  it 'sets capacity to arg value when initialised with a numerical arg' do
    expect(Airport.new(10).capacity).to eq 10
    expect(Airport.new("10").capacity).to eq 10
    expect(Airport.new(10.75).capacity).to eq 10
    expect(Airport.new(2 * 5).capacity).to eq 10
    expect(Airport.new([5,5].sum).capacity).to eq 10
  end

  it 'sets capacity to default when initialised without argument' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'returns error when initialised with non-numerical arg' do
    expect { Airport.new("ten") }.to raise_error 'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
    expect { Airport.new([10]) }.to raise_error 'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
  end

  it 'returns error when initialised with arg == 0' do
    expect { Airport.new(0) }.to raise_error 'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
  end

=begin
  describe '#check_weather' do
    it 'sets @weather to a weather symbol (:sunny or :stormy) when called' do
      subject.check_weather(weather_su)
      expect(subject.weather).to eq :sunny
    end

    it 'can change the value of @weather if new weather symbol is reported' do
      subject.check_weather(weather_su)
      expect(subject.weather).to eq :sunny
      subject.check_weather(weather_st)
      expect(subject.weather).to eq :stormy
    end
  end
=end
end