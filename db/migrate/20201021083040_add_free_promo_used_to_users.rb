class AddFreePromoUsedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :free_promo_used, :boolean
  end
end
