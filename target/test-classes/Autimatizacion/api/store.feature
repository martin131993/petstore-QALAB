Feature: Validación de la API de PetStore

  @crear
  Scenario Outline: Crear un pedido de mascota
    Given url 'https://petstore.swagger.io/v2/store/order'
    And header Content-Type = 'application/json'
    And request
      """
      {
        "id": 0,
        "petId": <petId>,
        "quantity": <quantity>,
        "shipDate": "2025-08-26T03:30:47.500Z",
        "status": "placed",
        "complete": true
      }
      """
    When method post
    Then status 200
    And match response.id == '#number'
    And match response.status == 'placed'
    * def orderId = response.id
    * print 'Orden creada con ID ->', orderId

    Examples:
      | petId | quantity |
      | 101   | 1        |
      | 102   | 2        |
      | 103   | 1        |


  @buscar
  Scenario: Consultar orden creada

    Given url 'https://petstore.swagger.io/v2/store/order/' + orderId
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    And match response.id == orderId
    And match response.status == 'placed'
    And match response.complete == true
    * print 'Datos de la orden consultada:', response










