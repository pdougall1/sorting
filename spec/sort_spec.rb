require 'rspec'
require_relative '../bubble'
require_relative '../merge'

describe Sort::Bubble do
  subject { Sort::Bubble.sort(arr) }
  context "with an empty array" do
    let(:arr) { [] }
    it { is_expected.to eq [] }
  end

  context "with a single element array" do
    let(:arr) { [1] }
    it { is_expected.to eq [1] }
  end

  context "with a complex array" do
    let(:arr) { [1, 1, 0, 234, -234, 345324325432341242, -23412349237498237490234797098] }
    it { is_expected.to eq [-23412349237498237490234797098, -234, 0, 1, 1, 234, 345324325432341242] }
  end
end

describe Sort::Merge do
  subject { Sort::Merge.sort(arr) }
  context "with an empty array" do
    let(:arr) { [] }
    it { is_expected.to eq [] }
  end

  context "with a single element array" do
    let(:arr) { [1] }
    it { is_expected.to eq [1] }
  end

  context "with a complex array" do
    let(:arr) { [1, 1, 0, 234, -234, 345324325432341242, -23412349237498237490234797098] }
    it { is_expected.to eq [-23412349237498237490234797098, -234, 0, 1, 1, 234, 345324325432341242] }
  end
end
