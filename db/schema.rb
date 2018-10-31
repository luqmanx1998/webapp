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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_31_100518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "cover"
    t.string "video"
    t.bigint "user_id"
    t.integer "challenge_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_type_id"], name: "index_challenges_on_challenge_type_id"
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string "followable_type", null: false
    t.bigint "followable_id", null: false
    t.string "follower_type", null: false
    t.bigint "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower_type_and_follower_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_interests_on_name", unique: true
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "from_user_id"
    t.datetime "read_at"
    t.string "action"
    t.string "notifiable_type"
    t.bigint "notifiable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_user_id"], name: "index_notifications_on_from_user_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "post_playlists", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_post_playlists_on_playlist_id"
    t.index ["post_id"], name: "index_post_playlists_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "caption"
    t.text "content"
    t.string "type"
    t.string "url"
    t.boolean "content_processing", default: false, null: false
    t.jsonb "preferences", default: {}, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "views", default: 0, null: false
    t.string "submission_type"
    t.bigint "submission_id"
    t.boolean "draft", default: false, null: false
    t.integer "post_id"
    t.index ["submission_type", "submission_id"], name: "index_posts_on_submission_type_and_submission_id"
    t.index ["type"], name: "index_posts_on_type"
    t.index ["url"], name: "index_posts_on_url", unique: true
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_hashtag_hashtaggings", force: :cascade do |t|
    t.bigint "hashtag_id"
    t.string "hashtaggable_type"
    t.bigint "hashtaggable_id"
    t.index ["hashtag_id"], name: "index_hashtaggings_hashtag"
    t.index ["hashtaggable_id", "hashtaggable_type"], name: "index_hashtaggings_hashtaggable_id_hashtaggable_type"
    t.index ["hashtaggable_type", "hashtaggable_id"], name: "index_hashtaggings_hashtaggable"
  end

  create_table "simple_hashtag_hashtags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_simple_hashtag_hashtags_on_name"
  end

  create_table "user_interests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "interest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_user_interests_on_interest_id"
    t.index ["user_id"], name: "index_user_interests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "username"
    t.integer "access_level", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "name"
    t.text "bio"
    t.jsonb "preferences", default: {}, null: false
    t.datetime "last_seen_at"
    t.index ["access_level"], name: "index_users_on_access_level"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "challenges", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "notifications", "users", column: "from_user_id"
  add_foreign_key "playlists", "users"
  add_foreign_key "post_playlists", "playlists"
  add_foreign_key "post_playlists", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "user_interests", "interests"
  add_foreign_key "user_interests", "users"
end
