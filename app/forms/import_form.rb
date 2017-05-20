class ImportForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :file

  validates :file, :content, presence: true

  private

  def content
    file.read if file.present?
  end
end
