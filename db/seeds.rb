# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

merchant1 = Merchant.create(email: "test@test.com", live_on: "2022-01-01", disbursement_frequency: "WEEKLY", minimum_monthly_fees_cents: 2900)
merchant2 = Merchant.create(email: "test2@test.com", live_on: "2021-05-25", disbursement_frequency: "DAILY", minimum_monthly_fees_cents: 2900)

order1 = Order.create(merchant: merchant1, amount_cents: 6174)
order2 = Order.create(merchant: merchant2, amount_cents: 29308)
