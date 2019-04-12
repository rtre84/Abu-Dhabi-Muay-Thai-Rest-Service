# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AbuDhabiMuayThai.Repo.insert!(%AbuDhabiMuayThai.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias AbuDhabiMuayThai.Repo
alias AbuDhabiMuayThai.AccountMgmt.User

%User{
  name: "Sand Castle",
  active: true,
  description: "hgfdjkh",
  email: "anup.vasudevan.84@gmail.com"
} |> Repo.insert!
