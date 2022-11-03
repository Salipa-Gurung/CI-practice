class LoginPage {
  constructor() {
    //locators
    this.emailSelector = "//input[@name='email']";
    this.passwordSelector = "//input[@name='password']";
    this.loginBtnSelector = "//input[@value='Login']";
    this.logoutBtnSelector = "//span[@class='hide-sm']";
    this.alertMsgSelector = "//div[@class='alert alert-danger']";
  }

  async navigate() {
    await page.goto("http://localhost:3000/");
  }

  async fillLoginInputFields(inputData) {
    await page.fill(this.emailSelector, inputData[0].email);
    await page.fill(this.passwordSelector, inputData[0].password);
  }

  async clickLoginBtn() {
    await page.click(this.loginBtnSelector);
  }
}
module.exports = { LoginPage };
