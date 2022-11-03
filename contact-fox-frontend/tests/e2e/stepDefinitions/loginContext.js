const { Given, When, Then } = require("@cucumber/cucumber");

Given("the user has navigated to login page", async function () {
  console.log("Navigated to Login page");
  await page.goto("http://localhost:3000/");
  // await page.pause();
});

When(
  "user enters correct credentials with email {string} and password {string}",
  function (email, password) {
    console.log("Enters Credentials");
    const validEmail = "valid email";
    if (validEmail !== email) {
      throw new Error("Email is invalid");
    }
    console.log(email);
    console.log(password);
  }
);

Then("user should be navigated to Contact Fox page", function () {
  console.log("Navigated to Contact Fox page");
});

When(
  "user enters incorrect credentials with email {string} and password {string}",
  function (string, string2) {
    console.log("Incorrect credential");
    console.log(string, string2);
  }
);

When("user clicks login button", function () {
  console.log("clicks Login button");
});

Then("error message {string} should be shown", function (string) {
  console.log("Error message thrown");
});

When("User logins with valid credentials", function (dataTable) {
  const myTable = dataTable.hashes();
  for (let i = 0; i < myTable.length; i++) {
    const email = myTable[i].email;
    const password = myTable[i].password;
    console.log("Email: " + email);
    console.log("Password: " + password);
  }
});
