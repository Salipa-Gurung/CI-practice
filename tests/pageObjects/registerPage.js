const { expect } = require("@playwright/test");
const axios = require("axios");

class RegisterPage {
  constructor() {
    this.registerPageURL = "http://localhost:3000/register";
    this.nameSelector = "//input[@name='name']";
    this.emailSelector = "//input[@name='email']";
    this.passwordSelector = "//input[@name='password']";
    this.confirmPassword = "//input[@name='password2']";
    this.registerBtnSelector = "//input[@value='Register']";
    this.alertMsgSelector = "//div[@class='alert alert-danger']";
  }

  async navigateToRegistrationPage() {
    await page.goto(this.registerPageURL);
  }

  async registerAUser(data) {
    await page.fill(this.nameSelector, data.name);
    await page.fill(this.emailSelector, data.email);
    await page.fill(this.passwordSelector, data.password);
    await page.fill(this.confirmPassword, data.confirmPassword);
    let res = await axios.get("http://localhost:5000");
    console.log("This is the reponse from server: " + res.data);
    await page.click(this.registerBtnSelector);

    // await expect(page.locator(this.alertMsgSelector)).toBeVisible();
  }
}
module.exports = { RegisterPage };
