require 'present'

RSpec.describe Present do
    it "wraps and unwraps a value" do
        present = Present.new
        present.wrap(3)
        expect(present.unwrap). to eq 3
    end


    context "when no contents has been wrapped so can't unwrap" do
         it "fails" do
            present = Present.new
            expect { present.unwrap }. to raise_error "No contents have been wrapped."
         end
     end
     
     context "when contents has already been wrapped" do
        it "fails" do
            present = Present.new
            present.wrap(3)
            expect { present.wrap(10) }. to raise_error "A contents has already been wrapped."
            expect { present.unwrap }. to eq 3
        end
    end        
end

#in the last test, the content added could be any figure as it just represents the 'second wrapping'.
#We also add a cornercase test where we're ensuring that the 10 isn't wrapped anyway by checking that unwrap still returns 3.  