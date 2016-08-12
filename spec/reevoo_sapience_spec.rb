require "spec_helper"

describe ReevooSapience do
  it "has a version number" do
    expect(ReevooSapience::VERSION).not_to be nil
  end

  its(:config) do
    is_expected.to be_a(Hash)
  end

  describe ".config" do
    let(:default_appenders) do
      [
        { "file" => { "io" => "STDOUT", "formatter" => "<%= ENV['SAPIENCE_FORMATTER'] %>" } },
        { "statsd" => { "url" => "<%= ENV['STATSD_URL'] %>" } },
        { "sentry" => { "dsn" => "<%= ENV['RAVEN_DSN'] %>" } },
      ]
    end
    subject { described_class.config }

    its(["test"]) do
      is_expected.to be_a(Hash)
    end
    its(["development"]) do
      is_expected.to be_a(Hash)
    end
    its(["production"]) do
      is_expected.to be_a(Hash)
    end
    its(["staging"]) do
      is_expected.to be_a(Hash)
    end
    its(["integration"]) do
      is_expected.to be_a(Hash)
    end
    its(["ci"]) do
      is_expected.to be_a(Hash)
    end

    describe "['defaults']" do
      subject { described_class.config["defaults"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end

    describe "['test']" do
      subject { described_class.config["defaults"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end

    describe "['development']" do
      subject { described_class.config["defaults"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end

    describe "['production']" do
      subject { described_class.config["defaults"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end

    describe "['staging']" do
      subject { described_class.config["defaults"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end

    describe "['integration']" do
      subject { described_class.config["defaults"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end

    describe "['ci']" do
      subject { described_class.config["defaults"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end
  end
end
