require "spec_helper"

describe ReevooSapience do
  it "has a version number" do
    expect(ReevooSapience::VERSION).not_to be nil
  end

  its(:config) do
    is_expected.to be_a(Hash)
  end

  describe ".config" do
  end
end
