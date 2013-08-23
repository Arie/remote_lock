shared_examples_for "a remote lock adapter" do |storage|
  let(:adapter) { described_class.new(storage) }
  let(:key)      { 'my_test_key' }

  it "should behave like RemoteLock::Strategies::Base" do
    RemoteLock::Adapters::Base.valid?(adapter).should be_true
  end


  describe "#store" do
    it "should set the key as acquired" do
      adapter.has_key?(key).should be_false
      adapter.store(key, 100)
      adapter.has_key?(key).should be_true
    end
  end

  describe "#delete" do
    it "should remove the key as locked" do
      adapter.store(key, 100)
      adapter.has_key?(key).should be_true
      adapter.delete(key)
      adapter.has_key?(key).should be_false
    end
  end

end
