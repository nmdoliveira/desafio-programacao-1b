RSpec.feature "User can import orders", js: true do
  given!(:valid_file_path) { file_path "dados" }
  given!(:empty_file_path) { file_path "empty" }
  given!(:invalid_file_path) { file_path "invalid" }

  background do
    visit root_path
    expect(page).to have_content "Nenhuma venda registrada"
    make_file_input_visible
  end

  scenario "imports valid file" do
    attach_file "import_form_file", valid_file_path
    expect(page).to have_content "TOTAL: R$ 95,00"
    expect(page).to have_content "João Silva"
    expect(page).to have_content "Amy Pond"
    expect(page).to have_content "Marty McFly"
    expect(page).to have_content "Snake Plissken"
  end

  scenario "rejects empty file" do
    attach_file "import_form_file", empty_file_path
    expect(page).to have_content "o arquivo está vazio"
  end

  scenario "creates failed import for invalid file" do
    attach_file "import_form_file", invalid_file_path
    expect(page).to have_content "A importação desse arquivo falhou"
  end

  def file_path(name)
    Rails.root.join("spec/support/files/#{name}.txt")
  end

  def make_file_input_visible
    execute_script "$('#import_form_file').removeClass('hidden')"
  end
end
