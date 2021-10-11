# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Boken.Repo.insert!(%Boken.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
for title <- ["Home Improvement", "Power Tools", "Gardening", "Books"] do
   {:ok, _} = Boken.Catalog.create_category(%{title: title})
end

{:ok, _} = Boken.Light.create_light(%{name: "Den bästa", brightness: 10})
