class AddHospitals < ActiveRecord::Migration
  def self.up
  ['Demo hospital 1', 'Demo hospital 2', 'Demo hospital 3'].map{|h| Hospital.create(:name => h)}
  end

  def self.down
    ['Demo hospital 1', 'Demo hospital 2', 'Demo hospital 3'].map{|h| Hospital.find_by_name(h).destroy}
  end
end
