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

ActiveRecord::Schema.define(version: 20191106154653) do

  create_table "comentarios", force: :cascade do |t|
    t.string "titulo"
    t.string "texto"
    t.integer "produto_id"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comentavel_id"
    t.string "comentavel_type"
    t.index ["produto_id"], name: "index_comentarios_on_produto_id"
    t.index ["usuario_id"], name: "index_comentarios_on_usuario_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "produto_id"
    t.integer "pedido_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantidade", default: 1
    t.index ["pedido_id"], name: "index_items_on_pedido_id"
    t.index ["produto_id"], name: "index_items_on_produto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.integer "usuario_id"
    t.index ["usuario_id"], name: "index_pedidos_on_usuario_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.integer "codigo"
    t.string "nome"
    t.string "marca"
    t.integer "quantidade_estoque"
    t.decimal "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.boolean "admin"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

end
