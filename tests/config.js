const {
  Before,
  BeforeAll,
  After,
  AfterAll,
  setDefaultTimeout,
} = require("@cucumber/cucumber");
const { chromium } = require("playwright");
const clearDatabase = require("./dbCleanUp");

Before(async function () {
  console.log("This is executed before every scenario");
  global.context = await browser.newContext();
  global.page = await context.newPage();
});

setDefaultTimeout(60000);

After(async function () {
  console.log("This is executed after every scenario");
  await clearDatabase();
  await global.page.close();
  await global.context.close();
});

BeforeAll(async function () {
  console.log("This is executed in the begining of login feature");
  global.browser = await chromium.launch({
    headless: false,
    slowMo: 200,
    channel: "chrome",
  });
});

AfterAll(async function () {
  console.log("This is executed at the end of login feature");
  await global.browser.close();
});
