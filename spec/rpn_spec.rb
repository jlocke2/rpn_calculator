require 'rpn'

describe RPN do
  let(:rpn) {RPN.new}
  let(:operands) {rpn.instance_variable_get(:@operands)}
  let(:output) {rpn.instance_variable_get(:@output)}
  let(:input) {rpn.instance_variable_get(:@input)}

  describe "#get_input" do
    context "given 2" do
      it "returns 2" do
        allow(STDIN).to receive(:gets) { '2' }
        expect(rpn.send(:get_input)).to eq "2"
      end
    end
  end

  describe "#operate" do
    context "given 2 2 +" do
      it "returns 4" do
        rpn.send(:add_to_operands, 2)
        rpn.send(:add_to_operands, 2)
        rpn.send(:operate, '+')
        expect(operands.pop).to eq 4
      end
    end

    context "given 8 2 -" do
      it "returns 6" do
        rpn.send(:add_to_operands, 8)
        rpn.send(:add_to_operands, 2)
        rpn.send(:operate, '-')
        expect(operands.pop).to eq 6
      end
    end

    context "given 3 2 *" do
      it "returns 6" do
        rpn.send(:add_to_operands, 3)
        rpn.send(:add_to_operands, 2)
        rpn.send(:operate, '*')
        expect(operands.pop).to eq 6
      end
    end

    context "given 10 5 /" do
      it "returns 2" do
        rpn.send(:add_to_operands, 10)
        rpn.send(:add_to_operands, 5)
        rpn.send(:operate, '/')
        expect(operands.pop).to eq 2
      end
    end
  end

  describe "#add_to_operands" do
    context "given 2" do
      it "returns 2" do
        rpn.send(:add_to_operands, 2)
        expect(operands.pop).to eq 2
      end
    end

    context "given 'k'" do
      it "returns error string" do
        rpn.send(:add_to_operands, 'k')
        output = "Please enter a number, a math symbol, or the letter q to exit"
      end
    end
  end

  describe "#trim" do
    context "given 2" do
      it "returns 2" do
        expect(rpn.send(:trim, 2)).to eq 2
      end
    end

    context "given 2.0" do
      it "returns 2" do
        expect(rpn.send(:trim, 2.0)).to eq 2
      end
    end

    context "given 2.5" do
      it "returns 2.5" do
        expect(rpn.send(:trim, 2.5)).to eq 2.5
      end
    end

    context "given 2.50" do
      it "returns 2.5" do
        expect(rpn.send(:trim, 2.50)).to eq 2.5
      end
    end
  end

end