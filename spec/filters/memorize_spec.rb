require 'spec_helper'
require "logstash/filters/memorize"

describe LogStash::Filters::Memorize do
  describe "Captures id field" do
    let(:config) do <<-CONFIG
      filter {
        memorize {
          fields => "id"
        }
      }
    CONFIG
    end

    sample("id" => "1") do
      expect(subject).to include("id")
      expect(subject.get('id')).to eq('1')
    end
  end
end
