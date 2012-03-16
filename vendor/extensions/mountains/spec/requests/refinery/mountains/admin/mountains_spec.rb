# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Mountains" do
    describe "Admin" do
      describe "mountains" do
        login_refinery_user

        describe "mountains list" do
          before(:each) do
            FactoryGirl.create(:mountain, :name => "UniqueTitleOne")
            FactoryGirl.create(:mountain, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.mountains_admin_mountains_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.mountains_admin_mountains_path

            click_link "Add New Mountain"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Mountains::Mountain.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Mountains::Mountain.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:mountain, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.mountains_admin_mountains_path

              click_link "Add New Mountain"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Mountains::Mountain.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:mountain, :name => "A name") }

          it "should succeed" do
            visit refinery.mountains_admin_mountains_path

            within ".actions" do
              click_link "Edit this mountain"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:mountain, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.mountains_admin_mountains_path

            click_link "Remove this mountain forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Mountains::Mountain.count.should == 0
          end
        end

      end
    end
  end
end
