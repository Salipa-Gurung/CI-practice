const { expect } = require("@playwright/test");

class HomePage {
  constructor() {
    this.logoutBtnSelector = "//span[@class='hide-sm']";
    this.greetingSelector = "//li[1]";
  }

  async navigateToHomePage() {
    const logoutBtnLocator = await page.locator(this.logoutBtnSelector);
    await expect(page.locator(logoutBtnLocator)).toBeVisible();
    await expect(page.locator(this.greetingSelector)).toContainText("Hello, ");
  }

  async logout() {
    await page.click(this.logoutBtnSelector);
  }

  async addContact() {}
}
module.exports = { HomePage };
