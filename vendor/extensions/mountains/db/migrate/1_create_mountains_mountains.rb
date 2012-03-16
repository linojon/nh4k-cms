class CreateMountainsMountains < ActiveRecord::Migration

  def up
    create_table :refinery_mountains do |t|
      t.string :name
      t.integer :elevation
      t.decimal :lat
      t.decimal :lng
      t.string :trailsnh
      t.string :netc
      t.string :amc
      t.text :notes
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-mountains"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/mountains/mountains"})
    end

    drop_table :refinery_mountains

  end

end
