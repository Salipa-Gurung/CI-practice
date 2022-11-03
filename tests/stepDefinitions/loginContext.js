const { Given, When, Then } = require("@cucumber/cucumber");
const { expect } = require("@playwright/test");
const { LoginPage } = require("../pageObjects/loginPage");

const loginPage = new LoginPage();

Given("the user has navigated to login page", async function () {
  await loginPage.navigate();
});

When("user login with following credentials", async function (dataTable) {
  const inputData = dataTable.hashes();

  await loginPage.fillLoginInputFields(inputData);
  await loginPage.clickLoginBtn();
});

// For valid credentials
Then("user should be navigated to Contact Fox page", async function () {
  const logoutBtnLocator = page.locator(loginPage.logoutBtnSelector);
  await expect(logoutBtnLocator).toBeVisible();
});

// For invalid credential
Then("error message {string} should be shown", async function (alertMessage) {
  await expect(page.locator(loginPage.alertMsgSelector)).toContainText(
    alertMessage
  );
});
