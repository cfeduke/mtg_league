require 'spec_helper'

describe League do
  describe "validations" do
    context "when invalid" do
      subject { League.new }
      before { League.valid? }
      it "requires a name" do
        expect(subject).to have(1).error_on(:name)
      end
    end
  end
end
