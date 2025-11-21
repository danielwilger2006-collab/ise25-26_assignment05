Feature: Points of Sale Management
  This feature allows users to create and modify points of sale (POS).

  Scenario: Insert and retrieve two POS
    Given an empty POS list
    When I insert POS with the following elements
      | name                   | description                      | type            | campus    | street          | houseNumber  | postalCode | city       |
      | Schmelzpunkt           | Great waffles                    | CAFE            | ALTSTADT  | Hauptstraße     | 90           | 69117      | Heidelberg |
      | Bäcker Görtz           | Walking distance to lecture hall | BAKERY          | INF       | Berliner Str.   | 43           | 69120      | Heidelberg |
      | New Vending Machine    | Use only in case of emergencies  | VENDING_MACHINE | BERGHEIM  | Teststraße      | 99a          | 12345      | Other City |
    Then the POS list should contain the same elements in the same order

# TODO: Add new scenario "Update one of three existing POS"
Scenario: Update one of three existing POS
    Given the following POS exist
      | name                | description         | type            | campus    | street        | houseNumber | postalCode | city       |
      | A-Cafe              | First description   | CAFE            | ALTSTADT  | Straße 1      | 1           | 11111      | Stadt A    |
      | B-Bakery            | Second description  | BAKERY          | INF       | Straße 2      | 2           | 22222      | Stadt B    |
      | C-Vendor            | Third description   | VENDING_MACHINE | BERGHEIM  | Straße 3      | 3           | 33333      | Stadt C    |
    When I update the POS with name "B-Bakery" to have description "Updated bakery"
    Then the POS with name "B-Bakery" should have description "Updated bakery"
