require_relative '../test_helper'

require_relative '../models/car'
require_relative '../models/callback_test_class'

describe CsvRecord::Callbacks do
  describe "Check the callback definitions" do
    let (:klass) { CallbackTestClass }

    it ('before_create callback') { klass.must_respond_to(:before_create) }
    it ('after_create callback') { klass.must_respond_to(:after_create) }
    it ('before_save callback') { klass.must_respond_to(:before_save) }
    it ('after_save callback') { klass.must_respond_to(:after_save) }
    it ('after_initialize callback') { klass.must_respond_to(:after_initialize) }
  end

  describe "Check the run callback definitions" do
    let (:klass) { CallbackTestClass.new }

    it ('run before_create callbacks') { klass.must_respond_to(:run_before_create_callbacks) }
    it ('run after_create callbacks') { klass.must_respond_to(:run_after_create_callbacks) }
    it ('run before_save callbacks') { klass.must_respond_to(:run_before_save_callbacks) }
    it ('run after_save callbacks') { klass.must_respond_to(:run_after_save_callbacks) }
    it ('run after_initialize callbacks') { klass.must_respond_to(:run_after_initialize_callbacks) }
  end

  describe 'Checking the callbacks execution' do
    let (:object_created) { CallbackTestClass.create }

    it 'before_create' do
      object_created.before_create_called.must_equal true
    end

    it 'after_create' do
      object_created.after_create_called.must_equal true
    end
  end
end