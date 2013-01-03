require 'spec_helper'

describe League do
  describe "validations" do
    context "when all nil" do
      subject { League.new }
      before { subject.valid? }
      [:name, :start, :end].each do |sym|
        it "requires a #{sym}" do
          expect(subject.errors_on(sym)).to include("can't be blank")
        end
      end
    end
    context "when invalid values" do
      context "when dates" do
        [:start, :end].each do |sym|
          it "expects a date for #{sym}" do
            expect(League.new(sym => "xyz").errors_on(sym)).to include("is not a valid date")
          end
        end
      end
    end

    context "when violating business rules" do
      it "cannot have a start date after end date" do
        subject = League.new do |l|
          l.start = Date.today + 3.days
          l.end = Date.today
        end
        expect(subject.errors_on(:start)).to include("must be before end date")
      end
    end
  end
end
