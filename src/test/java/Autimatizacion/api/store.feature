Feature: Validación de la API de PetStore

  @crear
  Scenario: Realizar pedido de una mascota
    Given url 'https://petstore.swagger.io/v2/store/order'
    And header Content-type = 'application/json'
    And request
      """
      {
        "id": 0,
        "petId": 0,
        "quantity": 1,
        "shipDate": "2025-08-26T03:30:47.500Z",
        "status": "placed",
        "complete": true
      }
      """
    When method post
    Then status 200
    * print response

  @buscar
  Scenario Outline: Consultar orden creada
    Given url 'https://petstore.swagger.io/v2/store/order/'+<id>
    And header Content-type = 'application/json'
    When method GET
    Then status 200
    * print 'Esta es la mascota', response

Examples:
| id |
| 1 |
| 2  |
| 3  |









