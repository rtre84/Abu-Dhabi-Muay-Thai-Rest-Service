defmodule AbuDhabiMuayThai.AccountMgmtTest do
  use AbuDhabiMuayThai.DataCase

  alias AbuDhabiMuayThai.AccountMgmt

  describe "users" do
    alias AbuDhabiMuayThai.AccountMgmt.User

    @valid_attrs %{active: true, date_joined: "2010-04-17T14:00:00Z", description: "some description", email: "some email", id: 42, name: "some name", password: "some password", role_id: 42}
    @update_attrs %{active: false, date_joined: "2011-05-18T15:01:01Z", description: "some updated description", email: "some updated email", id: 43, name: "some updated name", password: "some updated password", role_id: 43}
    @invalid_attrs %{active: nil, date_joined: nil, description: nil, email: nil, id: nil, name: nil, password: nil, role_id: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AccountMgmt.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert AccountMgmt.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert AccountMgmt.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = AccountMgmt.create_user(@valid_attrs)
      assert user.active == true
      assert user.date_joined == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert user.description == "some description"
      assert user.email == "some email"
      assert user.id == 42
      assert user.name == "some name"
      assert user.password == "some password"
      assert user.role_id == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AccountMgmt.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = AccountMgmt.update_user(user, @update_attrs)
      assert user.active == false
      assert user.date_joined == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert user.description == "some updated description"
      assert user.email == "some updated email"
      assert user.id == 43
      assert user.name == "some updated name"
      assert user.password == "some updated password"
      assert user.role_id == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = AccountMgmt.update_user(user, @invalid_attrs)
      assert user == AccountMgmt.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = AccountMgmt.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> AccountMgmt.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = AccountMgmt.change_user(user)
    end
  end
end
