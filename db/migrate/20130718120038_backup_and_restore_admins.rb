class BackupAndRestoreAdmins < ActiveRecord::Migration
	def change
		reversible do |dir|
			dir.down do

				execute <<-SQL
					DROP TABLE IF EXISTS admins_backup
				SQL

				execute <<-SQL
					CREATE TABLE IF NOT EXISTS admins_backup
						SELECT * FROM admins
				SQL

			end

			dir.up do

				# create an empty table if it doesn't exist
				execute <<-SQL
					CREATE TABLE IF NOT EXISTS admins_backup
						SELECT * FROM admins WHERE id <> id;
				SQL

				# restore the backup, ignoring duplicates
				execute <<-SQL
					INSERT IGNORE INTO admins
						SELECT * FROM admins_backup;
				SQL

				execute <<-SQL
					DROP TABLE IF EXISTS admins_backup;
				SQL

			end
		end
  end
end
