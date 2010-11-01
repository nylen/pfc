# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101029010419) do

  create_table "account_balances", :force => true do |t|
    t.integer  "account_id",                                  :default => 0, :null => false
    t.integer  "upload_id"
    t.decimal  "balance",      :precision => 14, :scale => 2,                :null => false
    t.datetime "balance_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                                      :default => 0, :null => false
  end

  add_index "account_balances", ["account_id"], :name => "index_account_balances_on_account_id"
  add_index "account_balances", ["balance_date"], :name => "index_account_balances_on_balance_date"
  add_index "account_balances", ["created_at"], :name => "index_account_balances_on_created_at"
  add_index "account_balances", ["status"], :name => "index_account_balances_on_status"
  add_index "account_balances", ["updated_at"], :name => "index_account_balances_on_updated_at"
  add_index "account_balances", ["upload_id"], :name => "index_account_balances_on_upload_id"

  create_table "account_creds", :force => true do |t|
    t.string   "account_key",       :default => "", :null => false
    t.integer  "financial_inst_id",                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "creds",                             :null => false
    t.text     "cookies",                           :null => false
  end

  add_index "account_creds", ["account_key"], :name => "index_account_creds_on_account_key"
  add_index "account_creds", ["created_at"], :name => "index_account_creds_on_created_at"
  add_index "account_creds", ["financial_inst_id"], :name => "index_account_creds_on_financial_inst_id"
  add_index "account_creds", ["updated_at"], :name => "index_account_creds_on_updated_at"

  create_table "account_merchant_tag_stats", :force => true do |t|
    t.string   "account_key",                              :null => false
    t.integer  "merchant_id",                              :null => false
    t.integer  "tag_id",                                   :null => false
    t.string   "name",                                     :null => false
    t.integer  "sign",        :limit => 1, :default => -1, :null => false
    t.integer  "count",                    :default => 0,  :null => false
    t.integer  "forced",                   :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "account_merchant_tag_stats", ["merchant_id"], :name => "index_account_merchant_tag_stats_on_merchant_id"

  create_table "accounts", :force => true do |t|
    t.string   "name",                                                     :null => false
    t.string   "account_number",      :limit => 6
    t.string   "routing_number",      :limit => 9
    t.string   "account_key",         :limit => 64
    t.integer  "financial_inst_id"
    t.integer  "account_type_id",                   :default => 0,         :null => false
    t.string   "currency",            :limit => 3,                         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                            :default => 0,         :null => false
    t.string   "account_number_hash", :limit => 64
    t.string   "guid",                :limit => 64, :default => "",        :null => false
    t.boolean  "negate_balance",                    :default => false
    t.integer  "id_for_user"
    t.integer  "account_cred_id"
    t.string   "type",                :limit => 32, :default => "Account", :null => false
    t.integer  "position",                          :default => 0,         :null => false
  end

  add_index "accounts", ["account_cred_id"], :name => "index_accounts_on_account_cred_id"
  add_index "accounts", ["account_key"], :name => "index_accounts_on_account_key"
  add_index "accounts", ["account_number"], :name => "index_accounts_on_account_number"
  add_index "accounts", ["created_at"], :name => "index_accounts_on_created_at"
  add_index "accounts", ["financial_inst_id"], :name => "index_accounts_on_financial_inst_id"
  add_index "accounts", ["guid"], :name => "index_accounts_on_guid", :unique => true

  create_table "accounts_uploads", :id => false, :force => true do |t|
    t.integer  "account_id"
    t.integer  "upload_id"
    t.datetime "created_at"
  end

  add_index "accounts_uploads", ["account_id", "created_at"], :name => "index_accounts_uploads_on_account_id_and_created_at"
  add_index "accounts_uploads", ["account_id", "upload_id"], :name => "index_accounts_uploads_on_account_id_and_upload_id", :unique => true
  add_index "accounts_uploads", ["account_id"], :name => "index_accounts_uploads_on_account_id"
  add_index "accounts_uploads", ["created_at"], :name => "index_accounts_uploads_on_created_at"
  add_index "accounts_uploads", ["upload_id"], :name => "index_accounts_uploads_on_upload_id"

  create_table "attachments", :force => true do |t|
    t.string   "account_key",  :limit => 64
    t.string   "filename"
    t.string   "guid",         :limit => 64
    t.string   "description"
    t.string   "content_type", :limit => 64
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["account_key"], :name => "index_attachments_on_account_key"
  add_index "attachments", ["guid"], :name => "index_attachments_on_guid", :unique => true

  create_table "client_platforms", :force => true do |t|
    t.string   "name",       :limit => 128
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_platforms", ["name"], :name => "index_client_platforms_on_name"

  create_table "countries", :force => true do |t|
    t.string "name"
    t.string "currency",          :limit => 3
    t.string "code",              :limit => 2
    t.string "default_time_zone"
  end

  add_index "countries", ["code"], :name => "index_countries_on_code"
  add_index "countries", ["name"], :name => "index_countries_on_name"

  create_table "currency_exchange_rates", :force => true do |t|
    t.string "currency", :limit => 3, :default => "",  :null => false
    t.date   "date",                                   :null => false
    t.float  "rate",                  :default => 0.0, :null => false
  end

  add_index "currency_exchange_rates", ["currency", "date"], :name => "index_currency_exchange_rates_on_currency_and_date", :unique => true

  create_table "financial_insts", :force => true do |t|
    t.string   "name",                  :limit => 100
    t.string   "ofx_fid",               :limit => 100
    t.string   "ofx_org",               :limit => 100
    t.string   "ofx_url"
    t.string   "ofx_broker",            :limit => 32
    t.boolean  "ofx_fee",                               :default => false,    :null => false
    t.string   "homepage_url"
    t.string   "login_url"
    t.string   "wesabe_id",             :limit => 9
    t.integer  "status",                                :default => 0
    t.integer  "mapped_to_id"
    t.string   "username_label"
    t.string   "password_label"
    t.string   "connection_type",                       :default => "Manual"
    t.string   "date_format"
    t.integer  "statement_days"
    t.text     "help_text"
    t.integer  "statement_date_format",                 :default => 0,        :null => false
    t.boolean  "good_txid"
    t.boolean  "bad_balance",                           :default => false
    t.integer  "creating_user_id"
    t.integer  "country_id"
    t.integer  "ssu_support",           :limit => 1,    :default => 0,        :null => false
    t.string   "login_fields",          :limit => 4095
    t.boolean  "featured"
    t.string   "notes",                 :limit => 2047
    t.string   "timezone",              :limit => 32
    t.boolean  "date_adjusted",                         :default => false,    :null => false
    t.string   "account_number_regex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "financial_insts", ["country_id"], :name => "index_financial_insts_on_country_id"
  add_index "financial_insts", ["creating_user_id", "status"], :name => "index_financial_insts_on_creating_user_id_and_status"
  add_index "financial_insts", ["creating_user_id"], :name => "index_financial_insts_on_creating_user_id"
  add_index "financial_insts", ["name"], :name => "index_financial_insts_on_name"
  add_index "financial_insts", ["ofx_org"], :name => "index_financial_insts_on_ofx_org"
  add_index "financial_insts", ["status"], :name => "index_financial_insts_on_status"
  add_index "financial_insts", ["wesabe_id"], :name => "index_financial_insts_on_wesabe_id", :unique => true

  create_table "inbox_attachments", :force => true do |t|
    t.string   "account_key",   :limit => 64, :default => "", :null => false
    t.integer  "attachment_id",                               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inbox_attachments", ["account_key"], :name => "index_inbox_attachments_on_account_key"
  add_index "inbox_attachments", ["attachment_id"], :name => "index_inbox_attachments_on_attachment_id", :unique => true

  create_table "investment_balances", :force => true do |t|
    t.integer  "account_id",                                    :null => false
    t.integer  "upload_id",                                     :null => false
    t.decimal  "avail_cash",     :precision => 16, :scale => 4
    t.decimal  "margin_balance", :precision => 16, :scale => 4
    t.decimal  "short_balance",  :precision => 16, :scale => 4
    t.decimal  "buy_power",      :precision => 16, :scale => 4
    t.datetime "date"
    t.datetime "created_at"
  end

  add_index "investment_balances", ["created_at"], :name => "index_investment_balances_on_created_at"
  add_index "investment_balances", ["date"], :name => "index_investment_balances_on_date"

  create_table "investment_other_balances", :force => true do |t|
    t.integer  "investment_balance_id",                                              :null => false
    t.string   "name",                  :limit => 32
    t.string   "description",           :limit => 80
    t.string   "type",                  :limit => 8
    t.decimal  "value",                               :precision => 16, :scale => 4
    t.datetime "date"
    t.string   "currency",              :limit => 3
    t.decimal  "currency_rate",                       :precision => 24, :scale => 8
    t.datetime "created_at"
  end

  add_index "investment_other_balances", ["created_at"], :name => "index_investment_other_balances_on_created_at"
  add_index "investment_other_balances", ["date"], :name => "index_investment_other_balances_on_date"

  create_table "investment_positions", :force => true do |t|
    t.integer  "account_id",                                                             :null => false
    t.integer  "upload_id",                                                              :null => false
    t.integer  "investment_security_id",                                                 :null => false
    t.string   "sub_account_type"
    t.string   "position_type"
    t.decimal  "units",                  :precision => 16, :scale => 4, :default => 0.0
    t.decimal  "unit_price",             :precision => 16, :scale => 4, :default => 0.0
    t.decimal  "market_value",           :precision => 16, :scale => 4
    t.datetime "price_date"
    t.string   "memo"
    t.boolean  "reinvest_dividends"
    t.boolean  "reinvest_capital_gains"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investment_positions", ["created_at"], :name => "index_investment_positions_on_created_at"
  add_index "investment_positions", ["investment_security_id"], :name => "index_investment_positions_on_investment_security_id"
  add_index "investment_positions", ["updated_at"], :name => "index_investment_positions_on_updated_at"

  create_table "investment_securities", :force => true do |t|
    t.string   "unique_id",      :limit => 32, :null => false
    t.string   "unique_id_type", :limit => 10, :null => false
    t.string   "name"
    t.string   "ticker",         :limit => 32
    t.string   "fi_id",          :limit => 32
    t.string   "rating",         :limit => 32
    t.string   "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investment_securities", ["created_at"], :name => "index_investment_securities_on_created_at"
  add_index "investment_securities", ["name"], :name => "index_investment_securities_on_name"
  add_index "investment_securities", ["ticker"], :name => "index_investment_securities_on_ticker"
  add_index "investment_securities", ["unique_id"], :name => "index_investment_securities_on_unique_id"
  add_index "investment_securities", ["updated_at"], :name => "index_investment_securities_on_updated_at"

  create_table "investment_txactions", :force => true do |t|
    t.integer  "account_id",                                                                                :null => false
    t.integer  "upload_id",                                                                                 :null => false
    t.string   "txid"
    t.string   "wesabe_txid"
    t.datetime "original_trade_date"
    t.datetime "original_settle_date"
    t.datetime "trade_date"
    t.datetime "settle_date"
    t.string   "memo"
    t.integer  "investment_security_id"
    t.decimal  "units",                                     :precision => 16, :scale => 4, :default => 0.0
    t.decimal  "unit_price",                                :precision => 16, :scale => 4, :default => 0.0
    t.decimal  "commission",                                :precision => 16, :scale => 2, :default => 0.0
    t.decimal  "fees",                                      :precision => 16, :scale => 2, :default => 0.0
    t.decimal  "withholding",                               :precision => 16, :scale => 2, :default => 0.0
    t.string   "currency",                  :limit => 3
    t.decimal  "currency_rate",                             :precision => 24, :scale => 8
    t.decimal  "total",                                     :precision => 16, :scale => 4
    t.string   "sub_account_type"
    t.string   "sub_account_fund"
    t.string   "buy_sell_type"
    t.string   "income_type"
    t.decimal  "split_old_units",                           :precision => 16, :scale => 4
    t.decimal  "split_new_units",                           :precision => 16, :scale => 4
    t.decimal  "split_numerator",                           :precision => 8,  :scale => 2
    t.decimal  "split_denominator",                         :precision => 8,  :scale => 2
    t.string   "note",                      :limit => 1023
    t.string   "attachment_ids",            :limit => 64
    t.string   "tag_names",                 :limit => 1023
    t.integer  "transfer_txaction_id"
    t.string   "transfer_txaction_type",    :limit => 20
    t.integer  "merged_with_txaction_id"
    t.string   "merged_with_txaction_type", :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                    :limit => 3,                                   :default => 0,   :null => false
  end

  add_index "investment_txactions", ["account_id"], :name => "index_investment_txactions_on_account_id"
  add_index "investment_txactions", ["created_at"], :name => "index_investment_txactions_on_created_at"
  add_index "investment_txactions", ["investment_security_id"], :name => "index_investment_txactions_on_investment_security_id"
  add_index "investment_txactions", ["settle_date"], :name => "index_investment_txactions_on_settle_date"
  add_index "investment_txactions", ["trade_date"], :name => "index_investment_txactions_on_trade_date"
  add_index "investment_txactions", ["txid"], :name => "index_investment_txactions_on_txid"
  add_index "investment_txactions", ["updated_at"], :name => "index_investment_txactions_on_updated_at"
  add_index "investment_txactions", ["upload_id"], :name => "index_investment_txactions_on_upload_id"
  add_index "investment_txactions", ["wesabe_txid", "status"], :name => "index_investment_txactions_on_wesabe_txid_and_status", :unique => true

  create_table "merchant_bank_names", :force => true do |t|
    t.string   "filtered_name"
    t.integer  "merchant_id",     :default => 0,  :null => false
    t.integer  "txactions_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sign",            :default => -1, :null => false
  end

  add_index "merchant_bank_names", ["created_at"], :name => "index_merchant_bank_names_on_created_at"
  add_index "merchant_bank_names", ["filtered_name", "sign"], :name => "index_merchant_bank_names_on_filtered_name_and_sign"
  add_index "merchant_bank_names", ["txactions_count"], :name => "index_merchant_bank_names_on_txactions_count"
  add_index "merchant_bank_names", ["updated_at"], :name => "index_merchant_bank_names_on_updated_at"

  create_table "merchants", :force => true do |t|
    t.string   "name",                  :default => "",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "publicly_visible",      :default => false
    t.integer  "users_count"
    t.integer  "canonical_merchant_id"
    t.boolean  "canonical",             :default => false
    t.boolean  "unedited",              :default => false
    t.boolean  "non_merchant",          :default => false
  end

  add_index "merchants", ["canonical_merchant_id"], :name => "index_merchants_on_canonical_merchant_id"
  add_index "merchants", ["created_at"], :name => "index_merchants_on_created_at"
  add_index "merchants", ["name"], :name => "index_merchants_on_name", :unique => true
  add_index "merchants", ["publicly_visible"], :name => "index_merchants_on_publicly_visible"
  add_index "merchants", ["updated_at"], :name => "index_merchants_on_updated_at"
  add_index "merchants", ["users_count"], :name => "index_merchants_on_users_count"

  create_table "merchants_users", :force => true do |t|
    t.integer  "merchant_id"
    t.integer  "user_id",           :default => 0,     :null => false
    t.integer  "sign",              :default => -1,    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
    t.boolean  "autotags_disabled", :default => false, :null => false
  end

  add_index "merchants_users", ["created_at"], :name => "index_merchants_users_on_created_at"
  add_index "merchants_users", ["merchant_id"], :name => "index_merchants_users_on_merchant_id"
  add_index "merchants_users", ["rating"], :name => "index_merchants_users_on_rating"
  add_index "merchants_users", ["updated_at"], :name => "index_merchants_users_on_updated_at"
  add_index "merchants_users", ["user_id", "merchant_id"], :name => "index_merchants_users_on_user_id_and_merchant_id"
  add_index "merchants_users", ["user_id"], :name => "index_merchants_users_on_user_id"

  create_table "snapshots", :force => true do |t|
    t.integer  "user_id"
    t.string   "uid",        :null => false
    t.string   "error"
    t.datetime "built_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "snapshots", ["uid"], :name => "index_snapshots_on_uid", :unique => true
  add_index "snapshots", ["user_id"], :name => "index_snapshots_on_user_id"

  create_table "ssu_jobs", :force => true do |t|
    t.integer  "account_cred_id",                                 :null => false
    t.integer  "status",                                          :null => false
    t.string   "account_key",                     :default => "", :null => false
    t.string   "job_guid",                        :default => "", :null => false
    t.string   "result",                          :default => "", :null => false
    t.text     "account_ids"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data",            :limit => 4095
    t.integer  "version"
  end

  add_index "ssu_jobs", ["account_cred_id"], :name => "index_ssu_jobs_on_account_cred_id"
  add_index "ssu_jobs", ["account_key"], :name => "index_ssu_jobs_on_account_key"
  add_index "ssu_jobs", ["created_at"], :name => "index_ssu_jobs_on_created_at"
  add_index "ssu_jobs", ["expires_at"], :name => "index_ssu_jobs_on_expires_at"
  add_index "ssu_jobs", ["job_guid"], :name => "index_ssu_jobs_on_job_guid"
  add_index "ssu_jobs", ["updated_at"], :name => "index_ssu_jobs_on_updated_at"

  create_table "stocks", :force => true do |t|
    t.string "name",     :limit => 127, :null => false
    t.string "symbol",   :limit => 10,  :null => false
    t.string "exchange", :limit => 8
  end

  add_index "stocks", ["symbol"], :name => "index_stocks_on_symbol", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.decimal  "split_amount",     :precision => 14, :scale => 2
    t.string   "kind",                                            :default => "user"
    t.decimal  "usd_split_amount", :precision => 14, :scale => 2
    t.string   "name"
  end

  add_index "taggings", ["name"], :name => "index_taggings_on_name"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id"], :name => "index_taggings_on_taggable_id"

  create_table "tags", :force => true do |t|
    t.string   "normalized_name", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["normalized_name"], :name => "index_tags_on_normalized_name", :unique => true

  create_table "targets", :force => true do |t|
    t.string  "tag_name",                                        :null => false
    t.integer "tag_id"
    t.integer "user_id"
    t.decimal "amount_per_month", :precision => 14, :scale => 2
  end

  add_index "targets", ["tag_id"], :name => "index_targets_on_tag_id"
  add_index "targets", ["user_id"], :name => "index_targets_on_user_id"

  create_table "txaction_attachments", :force => true do |t|
    t.integer "attachment_id", :null => false
    t.integer "txaction_id",   :null => false
  end

  add_index "txaction_attachments", ["txaction_id"], :name => "index_txaction_attachments_on_txaction_id"

  create_table "txaction_taggings", :force => true do |t|
    t.integer  "tag_id",                                          :null => false
    t.integer  "txaction_id",                                     :null => false
    t.string   "name",                                            :null => false
    t.decimal  "split_amount",     :precision => 14, :scale => 2
    t.decimal  "usd_split_amount", :precision => 14, :scale => 2
    t.datetime "created_at"
  end

  add_index "txaction_taggings", ["tag_id"], :name => "index_txaction_taggings_on_tag_id"
  add_index "txaction_taggings", ["txaction_id"], :name => "index_txaction_taggings_on_txaction_id"

  create_table "txaction_types", :force => true do |t|
    t.string   "name"
    t.string   "display_name", :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "txaction_types", ["name"], :name => "name"

  create_table "txactions", :force => true do |t|
    t.integer  "account_id",                                                             :default => 0,     :null => false
    t.integer  "upload_id",                                                              :default => 0,     :null => false
    t.integer  "txaction_type_id",                                                       :default => 0,     :null => false
    t.string   "txid"
    t.string   "wesabe_txid",             :limit => 128
    t.datetime "date_posted"
    t.integer  "sequence"
    t.integer  "sic_code"
    t.decimal  "amount",                                  :precision => 14, :scale => 2, :default => 0.0,   :null => false
    t.string   "raw_name"
    t.string   "filtered_name"
    t.string   "cleaned_name"
    t.integer  "merchant_id"
    t.string   "memo"
    t.string   "check_num",               :limit => 20
    t.string   "ref_num",                 :limit => 32
    t.decimal  "balance",                                 :precision => 14, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                                                                 :default => 0,     :null => false
    t.boolean  "tagged",                                                                 :default => false
    t.integer  "merged_with_txaction_id"
    t.text     "note"
    t.decimal  "usd_amount",                              :precision => 14, :scale => 2
    t.string   "attachment_ids",          :limit => 64
    t.boolean  "automatch",                                                              :default => false, :null => false
    t.string   "merchant_name"
    t.string   "tag_names",               :limit => 1023
    t.integer  "transfer_txaction_id"
    t.datetime "fi_date_posted",                                                                            :null => false
  end

  add_index "txactions", ["account_id"], :name => "index_txactions_on_account_id"
  add_index "txactions", ["created_at"], :name => "index_txactions_on_created_at"
  add_index "txactions", ["date_posted"], :name => "index_txactions_on_date_posted"
  add_index "txactions", ["fi_date_posted"], :name => "index_txactions_on_fi_date_posted"
  add_index "txactions", ["filtered_name"], :name => "index_txactions_on_filtered_name"
  add_index "txactions", ["merchant_id"], :name => "index_txactions_on_merchant_id"
  add_index "txactions", ["transfer_txaction_id"], :name => "index_txactions_on_transfer_txaction_id"
  add_index "txactions", ["txaction_type_id"], :name => "index_txactions_on_txaction_type_id"
  add_index "txactions", ["updated_at"], :name => "index_txactions_on_updated_at"
  add_index "txactions", ["upload_id"], :name => "index_txactions_on_upload_id"
  add_index "txactions", ["usd_amount"], :name => "index_txactions_on_usd_amount"
  add_index "txactions", ["wesabe_txid", "status"], :name => "index_txactions_on_wesabe_txid_and_status", :unique => true

  create_table "upload_formats", :force => true do |t|
    t.string   "name",       :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "upload_formats", ["name"], :name => "index_upload_formats_on_name"

  create_table "uploads", :force => true do |t|
    t.integer  "client_platform_id",               :default => 0,  :null => false
    t.string   "client_version",     :limit => 16
    t.string   "client_name",        :limit => 32
    t.integer  "upload_format_id",                 :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                           :default => 0,  :null => false
    t.string   "filepath"
    t.integer  "financial_inst_id"
    t.string   "guid",               :limit => 8,  :default => "", :null => false
  end

  add_index "uploads", ["client_platform_id"], :name => "index_uploads_on_client_platform_id"
  add_index "uploads", ["created_at"], :name => "index_uploads_on_created_at"
  add_index "uploads", ["financial_inst_id"], :name => "index_uploads_on_financial_inst_id"
  add_index "uploads", ["guid"], :name => "index_uploads_on_guid", :unique => true
  add_index "uploads", ["status"], :name => "index_uploads_on_status"
  add_index "uploads", ["upload_format_id"], :name => "index_uploads_on_upload_format_id"

  create_table "user_logins", :force => true do |t|
    t.integer "user_id"
    t.date    "login_date"
  end

  add_index "user_logins", ["login_date"], :name => "index_user_logins_on_login_date"
  add_index "user_logins", ["user_id"], :name => "index_user_logins_on_user_id"

  create_table "user_preferences", :force => true do |t|
    t.integer  "user_id",     :default => 0, :null => false
    t.text     "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_preferences", ["user_id"], :name => "index_user_preferences_on_user_id"

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_profiles", ["user_id"], :name => "index_user_profiles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",              :limit => 64,                    :null => false
    t.string   "salt",                  :limit => 16
    t.string   "password_hash",         :limit => 64
    t.string   "name",                  :limit => 32
    t.datetime "last_web_login"
    t.datetime "last_api_login"
    t.integer  "role",                                :default => 0,     :null => false
    t.integer  "status",                              :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "postal_code",           :limit => 32
    t.integer  "country_id"
    t.string   "photo_key",             :limit => 16
    t.string   "feed_key"
    t.string   "goals_key"
    t.string   "email"
    t.string   "security_answers_hash", :limit => 64
    t.string   "encrypted_account_key", :limit => 96
    t.integer  "membership_type",                     :default => 0
    t.datetime "membership_expiration"
    t.string   "default_currency",      :limit => 3
    t.string   "normalized_name"
    t.boolean  "ignore_subnet",                       :default => false
    t.datetime "bozo_since"
    t.date     "last_upload_date"
    t.integer  "cobrand_id"
    t.integer  "bad_email"
    t.string   "uid",                   :limit => 64,                    :null => false
    t.string   "time_zone"
    t.string   "account_key"
  end

  add_index "users", ["account_key"], :name => "index_users_on_account_key", :unique => true
  add_index "users", ["cobrand_id"], :name => "index_users_on_cobrand_id"
  add_index "users", ["created_at"], :name => "index_users_on_created_at"
  add_index "users", ["feed_key"], :name => "index_users_on_feed_key"
  add_index "users", ["goals_key"], :name => "index_users_on_goals_key"
  add_index "users", ["last_api_login"], :name => "index_users_on_last_api_login"
  add_index "users", ["last_upload_date"], :name => "index_users_on_last_upload_date"
  add_index "users", ["last_web_login"], :name => "index_users_on_last_web_login"
  add_index "users", ["membership_expiration"], :name => "index_users_on_membership_expiration"
  add_index "users", ["membership_type"], :name => "index_users_on_membership_type"
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["normalized_name"], :name => "index_users_on_normalized_name", :unique => true
  add_index "users", ["photo_key"], :name => "index_users_on_photo_key"
  add_index "users", ["postal_code"], :name => "index_users_on_postal_code"
  add_index "users", ["uid"], :name => "index_users_on_uid", :unique => true
  add_index "users", ["updated_at"], :name => "index_users_on_updated_at"
  add_index "users", ["username", "cobrand_id"], :name => "index_users_on_username_and_cobrand_id", :unique => true

end
