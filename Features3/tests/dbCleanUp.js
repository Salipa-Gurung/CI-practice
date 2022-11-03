const mongoose = require("mongoose");
const DB_HOST = process.env.DB_HOST || "localhost";
const DB_PORT = process.env.DB_PORT || 27017;
const DB_NAME = process.env.DB_NAME || "contactmanager";
const DB_URI = `mongodb://${DB_HOST}:${DB_PORT}/${DB_NAME}?retryWrites=true&w=majority`;

const clearDatabase = async () => {
  try {
    await mongoose.connect(DB_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    await mongoose.connection.db.dropDatabase();
    console.log("Database cleared");
    mongoose.connection.close();
  } catch (error) {
    console.log("error deleting data", error);
    process.exit(1);
  }
};

module.exports = clearDatabase;
