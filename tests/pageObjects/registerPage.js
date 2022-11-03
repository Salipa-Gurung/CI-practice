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
    await page.click(this.registerBtnSelector);
  }
}
module.exports = { RegisterPage };
