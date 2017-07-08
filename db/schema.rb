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

ActiveRecord::Schema.define(version: 20170307003422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "clilabs", force: :cascade do |t|
    t.string   "nm",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exames", force: :cascade do |t|
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicamentos", force: :cascade do |t|
    t.string   "descricao",   limit: 255
    t.string   "dose",        limit: 255
    t.integer  "viaaplic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nm_paciente",      limit: 255
    t.date   "dt_nascimento"
    t.string "estado_civil",     limit: 255
    t.string "cor",              limit: 255
    t.string "naturalidade",     limit: 255
    t.string "endereco",         limit: 255
    t.string "bairro",           limit: 255
    t.string "cidade",           limit: 255
    t.string "uf",               limit: 2
    t.string "profissao",        limit: 255
    t.string "empresa",          limit: 255
    t.string "fone_empresa",     limit: 255
    t.string "fone_casa",        limit: 255
    t.string "celular",          limit: 255
    t.string "e_mail",           limit: 255
    t.string "situacao",         limit: 255
    t.string "encaminhado_por",  limit: 255
    t.date   "dt_prim_consulta"
    t.date   "dt_ult_consulta"
    t.string "antec_pai",        limit: 255
    t.string "antec_mae",        limit: 255
    t.string "antec_irmaos",     limit: 255
    t.string "antec_filhos",     limit: 255
    t.text   "obs1"
    t.text   "obs2"
    t.text   "obs3"
    t.text   "obs4"
    t.text   "obs5"
    t.text   "obs6"
    t.text   "obs7"
    t.text   "obs8"
    t.string "antec_conjuge",    limit: 255
  end

  create_table "padraos", force: :cascade do |t|
    t.string   "campo",      limit: 255
    t.text     "valores"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receitais", force: :cascade do |t|
    t.integer  "receita_id"
    t.integer  "medicamento_id"
    t.string   "qtde",           limit: 255
    t.string   "dose",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receitas", force: :cascade do |t|
    t.date     "data"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solexameis", force: :cascade do |t|
    t.integer  "solexame_id"
    t.integer  "exame_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "obs"
  end

  create_table "solexames", force: :cascade do |t|
    t.date     "data"
    t.integer  "clilab_id"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "viaaplics", force: :cascade do |t|
    t.string   "descricao",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
