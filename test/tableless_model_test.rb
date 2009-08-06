require 'test_helper'
require 'tableless_model'

class TablelessModelTest < ActiveSupport::TestCase
  test "invalid model" do
    @test_model = TestModel.new
    assert !@test_model.valid?
  end

  test "valid model" do
    @test_model = TestModel.new
    @test_model.name = "Patrick Espake"
    @test_model.telephone = "+554112345678"
    @test_model.firm = "Go2nPlay"
    @test_model.email = "patrickespake@gmail.com"
    @test_model.message = "Hello World!"
    assert @test_model.valid?
  end

  test "presence of name" do
    @test_model = TestModel.new
    @test_model.telephone = "+554112345678"
    @test_model.firm = "Go2nPlay"
    @test_model.email = "patrickespake@gmail.com"
    @test_model.message = "Hello World!"
    @test_model.save
    assert @test_model.errors.on('name')
  end

  test "presence of email" do
    @test_model = TestModel.new
    @test_model.name = "Patrick Espake"
    @test_model.telephone = "+554112345678"
    @test_model.firm = "Go2nPlay"
    @test_model.message = "Hello World!"
    @test_model.save
    assert @test_model.errors.on('email')
  end

  test "presence of message" do
    @test_model = TestModel.new
    @test_model.name = "Patrick Espake"
    @test_model.telephone = "+554112345678"
    @test_model.firm = "Go2nPlay"
    @test_model.email = "patrickespake@gmail.com"
    @test_model.save
    assert @test_model.errors.on('message')
  end

  test "invalid email" do
    @test_model = TestModel.new
    @test_model.name = "Patrick Espake"
    @test_model.telephone = "+554112345678"
    @test_model.firm = "Go2nPlay"
    @test_model.email = "patrickespake@..."
    @test_model.message = "Hello World!"
    @test_model.save
    assert @test_model.errors.on('email')
  end

  test "valid email" do
    @test_model = TestModel.new
    @test_model.name = "Patrick Espake"
    @test_model.telephone = "+554112345678"
    @test_model.firm = "Go2nPlay"
    @test_model.email = "patrickespake@gmail.com"
    @test_model.message = "Hello World!"
    @test_model.save
    assert_nil @test_model.errors.on('email')
  end

  test "invalid length of message" do
    @test_model = TestModel.new
    @test_model.name = "Patrick Espake"
    @test_model.telephone = "+554112345678"
    @test_model.firm = "Go2nPlay"
    @test_model.email = "patrickespake@gmail.com"
    @test_model.message = "He"
    @test_model.save
    assert @test_model.errors.on('message')
  end

  test "valid length of message" do
    @test_model = TestModel.new
    @test_model.name = "Patrick Espake"
    @test_model.telephone = "+554112345678"
    @test_model.firm = "Go2nPlay"
    @test_model.email = "patrickespake@gmail.com"
    @test_model.message = "Hello World!"
    @test_model.save
    assert_nil @test_model.errors.on('message')
  end

  test "not save" do
    @test_model = TestModel.new
    assert !@test_model.save
  end

  test "save" do
    @test_model = TestModel.new
    @test_model.name = "Patrick Espake"
    @test_model.telephone = "+554112345678"
    @test_model.firm = "Go2nPlay"
    @test_model.email = "patrickespake@gmail.com"
    @test_model.message = "Hello World!"
    assert @test_model.save
  end
end

class TestModel < TablelessModel
  column :name,      :string
  column :telephone, :string
  column :firm,      :string
  column :email,     :string
  column :message,   :text

  validates_presence_of :name, :email, :message
  validates_format_of   :email, :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates_length_of   :message, :minimum => 3
end