RSpec.describe "nil in Ruby" do
  it "is an object" do
    expect( nil.is_a?(Object) ).to eq(__), "unlike NULL in some other languages"
  end

  it "doesn't throw null pointer exceptions" do
    # Here we're created a begin - rescue - end block so that we can
    # capture the exception thrown, when we send nil a message that it
    # does not understand.

    begin
      nil.a_method_that_does_not_exist
    rescue Exception => exception
      # What sort of exception is thrown
      expect( exception.class ).to eq(__)

      # What extra information does ruby give us?
      expect( exception.message ).to match(/__/) # You can replace __ here with part of the message
    end
  end

  it "has a few methods defined on it" do
    expect( nil.nil? ).to eq(__)
    expect( nil.to_s ).to eq(__)
    expect( nil.inspect ).to eq(__)
  end

end
