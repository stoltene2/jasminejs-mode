
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
    And I press "C-c C-j it"
    Then I should see "fit("
    And the cursor should be before "expect"

  Scenario: Unfocus a test
    When I insert:
    """
    describe('my jasminejs tests', function () {
      fit('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j it"
    Then I should see "it("
    And I should not see "fit("
    And the cursor should be before "expect"


  Scenario: Focus a collection with fdescribe
    When I insert:
    """
    describe('my jasminejs tests', function () {
      it('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j dt"
    Then I should see "fdescribe("
    And the cursor should be before "expect"

  Scenario: Unfocus a collection with fdescribe
    When I insert:
    """
    fdescribe('my jasminejs tests', function () {
      it('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j dt"
    Then I should see "describe("
    And I should not see "fdescribe"
    And the cursor should be before "expect"

  Scenario: Set a test as pending
    When I insert:
    """
    describe('my jasminejs tests', function () {
      it('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j ip"
    Then I should see "xit"
    And the cursor should be before "expect"

  Scenario: Unset a test as pending
    When I insert:
    """
    describe('my jasminejs tests', function () {
      xit('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j ip"
    Then I should see "it"
    And I should not see "xit"
    And the cursor should be before "expect"

  Scenario: Set a collectiono as pending
    When I insert:
    """
    describe('my jasminejs tests', function () {
      it('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j dp"
    Then I should see "xdescribe"
    And the cursor should be before "expect"

  Scenario: Unset a collection as pending
    When I insert:
    """
    xdescribe('my jasminejs tests', function () {
      it('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j dp"
    Then I should see "describe"
    And I should not see "xdescribe"
    And the cursor should be before "expect"

  Scenario: Change an xit to fit
    When I insert:
    """
    describe('my jasminejs tests', function () {
      xit('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j it"
    Then I should see "fit"
    And I should not see "xit"
    And the cursor should be before "expect"

  Scenario: Change a fit to xit
    When I insert:
    """
    describe('my jasminejs tests', function () {
      fit('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j ip"
    Then I should see "xit"
    And I should not see "fit"
    And the cursor should be before "expect"

  Scenario: Change an xdescribe to fdescribe
    When I insert:
    """
    xdescribe('my jasminejs tests', function () {
      it('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j dt"
    Then I should see "fdescribe"
    And I should not see "xdescribe"
    And the cursor should be before "expect"

  Scenario: Change a fdescribe to xdescribe
    When I insert:
    """
    fdescribe('my jasminejs tests', function () {
      it('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j dp"
    Then I should see "xdescribe"
    And I should not see "ddescrib"
    And the cursor should be before "expect"

  Scenario: When I try to toggle a describe and there is none
    When I insert:
    """
      it('should focus this test', function () {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j dp"
    Then I should not see "xdescribe"
    And I should not see "fdescribe"
    And I should not see "describe"
    And the cursor should be before "expect"

  Scenario: When I try to toggle an it and there is none
    When I insert:
    """
    describe('my tests', function() {
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j it"
    Then I should not see "it"
    And I should not see "fit"
    And I should not see "xit"
    And the cursor should be before "expect"

Scenario: Focus a test with intermediate function call
    When I insert:
    """
    describe('my jasminejs tests', function () {
      it('should focus this test', function () {
        barit('a troublesome function call');
        expect(true).toBe(true);
      });
    });
    """
    And I go to the front of the word "expect"
    And I press "C-c C-j it"
    Then I should see "fit("
    And the cursor should be before "expect"
