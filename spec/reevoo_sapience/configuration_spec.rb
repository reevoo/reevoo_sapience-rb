require "spec_helper"

describe ReevooSapience::Configuration do


  describe "#config" do
    let(:raven_dsn) { "https://raven.api" }
    let(:statsd_url) { "udp://statsdurl:3333" }
    let(:sapience_formatter) { "json" }
    let(:default_appenders) do
      [
        { "file" => { "io" => "STDOUT", "formatter" => sapience_formatter } },
        { "statsd" => { "url" => statsd_url } },
        { "sentry" => { "dsn" => raven_dsn } },
      ]
    end
    let(:config) { described_class.new.config }

    subject { config }

    before do
      allow(ENV).to receive(:fetch).with('SAPIENCE_FORMATTER').and_return(sapience_formatter)
      allow(ENV).to receive(:fetch).with('STATSD_URL').and_return(statsd_url)
      allow(ENV).to receive(:fetch).with('RAVEN_DSN').and_return(raven_dsn)
    end

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
      subject { config["defaults"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end

    describe "['test']" do
      let(:sapience_formatter) { "color" }
      subject { config["test"] }
      its(["appenders"]) do
        is_expected.to eq([
          { "file" => { "io" => "STDOUT", "formatter" => sapience_formatter } }
        ])
      end
    end

    describe "['development']" do
      let(:sapience_formatter) { "color" }
      subject { config["development"] }
      its(["appenders"]) do
        is_expected.to eq([
          { "file" => { "io" => "STDOUT", "formatter" => sapience_formatter } }
        ])
      end
    end

    describe "['production']" do
      subject { config["production"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end

    describe "['staging']" do
      subject { config["staging"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end

    describe "['integration']" do
      subject { config["integration"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end

    describe "['ci']" do
      subject { config["ci"] }
      its(["appenders"]) do
        is_expected.to eq(default_appenders)
      end
    end
  end
end
