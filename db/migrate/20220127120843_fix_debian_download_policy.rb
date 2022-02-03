class FixDebianDownloadPolicy < ActiveRecord::Migration[6.0]
  def up
    Katello::RootRepository.where(content_type: "deb")
                           .where(download_policy: [nil, ""])
                           .update_all(:download_policy => "immediate")
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
