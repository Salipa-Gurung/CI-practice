const { Given, When, Then } = require("@cucumber/cucumber");
const { expect } = require("@playwright/test");
const { RegisterPage } = require("../pageObjects/registerPage");
const { HomePage } = require("../pageObjects/homePage");

const registerPage = new RegisterPage();
const homePage = new HomePage();

Given("User has navigated to register page", async function () {
  await registerPage.navigateToRegistrationPage();
});

When(
  "User registers new account entering following credentials",
  async function (dataTable) {
    const inputDatas = dataTable.hashes();
    for (let data of inputDatas) {
      await registerPage.registerAUser(data);
    }
  }
);

Then(
  "new user should be navigated to Contact Fox Home page",
  async function () {
    await homePage.navigateToHomePage();
  }
);

Given(
  "account has been created with following credentials",
  async function (dataTable) {
    const inputDatas = dataTable.hashes();
    for (let data of inputDatas) {
      await registerPage.registerAUser(data);
    }
  }
);

Given("user has navigated to home page", async function () {
  await homePage.navigateToHomePage();
});

Given("user has logged out", async function () {
  await homePage.logout();
});

Then(
  "pop up should appear showing informational message as {string} on the webUI",
  async function (alertMessage) {
    await expect(page.locator(registerPage.alertMsgSelector)).toContainText(
      alertMessage
    );
  }
);
