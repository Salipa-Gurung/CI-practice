const { Given, When, Then } = require("@cucumber/cucumber");
const { expect } = require("@playwright/test");

const nameSelector = "//input[@name='name']";
const emailSelector = "//input[@name='email']";
const phoneSelector = "//input[@name='phone']";
const addContactBtn = "//input[@value='Add Contact']";

Given(
  "Contacts with following details has been added",
  async function (dataTable) {
    const inputData = dataTable.hashes();

    // for (let i = 0; i < inputData.length; i++) {
    //   const contactTypeSelector = `//input[@value='${inputData[i].contactType}']`;

    //   await page.fill(nameSelector, inputData[i].name);
    //   await page.fill(emailSelector, inputData[i].email);
    //   await page.fill(phoneSelector, inputData[i].phone);
    //   await page.click(contactTypeSelector);
    //   await page.click(addContactBtn);

    //   console.log(contactTypeSelector);
    // }
    for (let data of inputData) {
      const contactTypeSelector = `//input[@value='${data.contactType}']`;

      await page.fill(nameSelector, data.name);
      await page.fill(emailSelector, data.email);
      await page.fill(phoneSelector, data.phone);
      await page.click(contactTypeSelector);
      await page.click(addContactBtn);
    }
  }
);

When("User deletes a contact with email {string}", async function (email) {
  const deleteBtnSelector = `//*[text()='${email}']/parent::ul/parent::div/p/button[text()='Delete']`;
  await page.click(deleteBtnSelector);
});

Then(
  "that contact with email {string} should be removed from contact list",
  async function (email) {
    // const checkEmailSelector =
    //   "//i[@class='fas fa-envelope-open-text']/parent::li";
    await page.waitForSelector(checkEmailSelector);
    const emailArray = await page.locator(checkEmailSelector).allInnerTexts();
    await expect().toBeEmpty();
    console.log(emailArray);
  }
);

Then(
  "another contact with email {string} should be displayed in contact list",
  function (string) {
    // Write code here that turns the phrase above into concrete actions
    return "pending";
  }
);
