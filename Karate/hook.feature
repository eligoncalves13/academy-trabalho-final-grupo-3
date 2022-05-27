@ignore
Feature: Hook

@CriarUsuario
Scenario: Criar usuário 
    * def payload = read('requestCriarUsuario.json')
    Given url baseUrl
    And path "users"
    And request payload
    When method post
    Then status 201