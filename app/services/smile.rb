class Smile
  DATA = { x: 10060, check_mark: 10004, question: 10068, plus_1: 128077 }.with_indifferent_access

  def initialize(*args)
    @value = args.map { |arg| DATA[arg] }.pack('U*')
  end

  def to_s
    @value
  end
end
