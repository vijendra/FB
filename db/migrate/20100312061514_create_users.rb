class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.integer :login_count, :default => 0, :null => false
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
      t.integer :hospital_id
      t.timestamps
    end
  
    add_index :users, :persistence_token
    add_index :users, :last_request_at

    create_table :roles do |t|
      t.column :name, :string
    end
    
    # generate the join table
    create_table :roles_users, :id => false do |t|
      t.column :role_id, :integer
      t.column :user_id, :integer
    end
  
    
    # Create admin role 
    admin = Role.create(:name => 'Admin')
    user1 = User.create do |u|
      u.username = 'admin1'
      u.password = u.password_confirmation = 'admin1'
      u.email = 'admin1@example.com'
    end
    user2 = User.create do |u|
      u.username = 'admin2'
      u.password = u.password_confirmation = 'admin2'
      u.email = 'admin2@example.com'
    end
    user3 = User.create do |u|
      u.username = 'admin3'
      u.password = u.password_confirmation = 'admin3'
      u.email = 'admin3@example.com'
    end
    user1.roles << admin
    user2.roles << admin
    user3.roles << admin
    add_index :users, :username, :unique => true
  end

  def self.down
    drop_table :users
  end
end
