
Feature: Toggle focus

  Scenario: Focus a test
    When I insert:
    """
    describe('my jasminejs tests', function () {
      it('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c j it"
    Then I should see "iit("
    And the cursor should be before "expect"

  Scenario: Unfocus a test
    When I insert:
    """
    describe('my jasminejs tests', function () {
      iit('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c j it"
    Then I should see "it("
    And I should not see "iit("
    And the cursor should be before "expect"


  Scenario: Focus a collection with ddescribe
    When I insert:
    """
    describe('my jasminejs tests', function () {
      it('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c j dt"
    Then I should see "ddescribe("
    And the cursor should be before "expect"

  Scenario: Unfocus a collection with ddescribe
    When I insert:
    """
    ddescribe('my jasminejs tests', function () {
      it('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c j dt"
    Then I should see "describe("
    And I should not see "ddescribe"
    And the cursor should be before "expect"
