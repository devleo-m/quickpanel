class User < ApplicationRecord
  belongs_to :role  # Define a associação com a tabela de papéis (roles)
  has_secure_password  # Garante que a senha seja criptografada antes de ser armazenada no banco de dados

  validates :email, presence: true, uniqueness: true  # Valida que o email seja único e não esteja em branco
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  # Valida que a senha esteja presente, tenha pelo menos 6 caracteres de comprimento, apenas se :password_required? for verdadeiro

  private

  def password_required?
    new_record? || !password.nil?
    # Retorna verdadeiro se o registro for novo (ou seja, ainda não foi salvo no banco de dados) ou se a senha não estiver em branco
  end
end
