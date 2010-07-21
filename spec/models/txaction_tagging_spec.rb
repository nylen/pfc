require 'spec_helper'

describe TxactionTagging do
  it_should_behave_like "it has a logged-in user"

  before do
    @valid_attributes = {
      :txaction => Txaction.make,
      :tag => Tag.make,
      :name => "Foo"
    }
    @txaction_tagging = TxactionTagging.create(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @txaction_tagging.should be_valid
  end

  it "should set the user name on the tag association" do
    @txaction_tagging.tag.name.should == @valid_attributes[:name]
  end

  describe "tagged flag filters" do
    before do
      @txaction = @txaction_tagging.txaction
    end

    it "should mark its transaction tagged when created" do
      @txaction.should be_tagged
    end

    it "should mark its transaction untagged when deleted" do
      @txaction.update_attribute(:tagged, true)
      @txaction.should be_tagged
      @txaction_tagging.destroy
      @txaction.should_not be_tagged
    end
  end
end