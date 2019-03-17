require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = { email: 'test@mail.com', password: 'qwerty' }
  end

  # получение формы входа
  test "should get login" do
    get session_login_url
    assert_response :success
  end

  # невозможность вычислений без аутентификации
  test "cant_get_acess_without_auto" do
    get grad_output_url, params: { id: 7 }
    assert_response :redirect
  end

  # необходимость входа/ регистрации для доступа к материалам
  test "should_registrate_before_using" do
    post users_url, params: { user: { email: @user[:email], password: @user[:password] }}
    get grad_newsx_path
    assert_response :success
  end

  # проверка добавления рецепта в базу данных
  test "add_new_reciep" do
    post users_url, params: { user: { email: @user[:email], password: @user[:password] }}
    bef = Article.count
    get grad_addnewar_path, params: {head: '4234234', tex: '1313213', reff: 'sdffsdfdsfs'}
    assert_response :success
    assert_equal Article.count, bef +1
  end

  # проверка удаление записи из базы данных
  test "delete_reciep" do
    post users_url, params: { user: { email: @user[:email], password: @user[:password] }}
    bef = Article.count
    get grad_addnewar_path, params: {head: '4234234', tex: '1313213', reff: 'sdffsdfdsfs'}
    delete grad_deletear_path, params: {arid: Article.last[:id].to_s}
    assert_equal bef, Article.count
  end
end
