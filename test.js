const jsonData = require("./data.json");

console.log(jsonData.id);
function checkId(jsonData) {
  if (jsonData.id !== "1") {
    throw new Error("Not 1");
  }
}
checkId(jsonData);
