package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
//                Class.forName("com.mysql.cj.jdbc.Driver");
//                con = DriverManager.getConnection("jdbc:mysql://sql6.freesqldatabase.com/sql6698943", "sql6698943", "mjZab2VR2n");

                con = DriverManager.getConnection("jdbc:sqlite:/mydb.db");
                Statement stmt = con.createStatement();

//                String createUserTableSql = "CREATE TABLE IF NOT EXISTS User ("
//                        + "    id INTEGER PRIMARY KEY AUTOINCREMENT,"
//                        + "    name TEXT,"
//                        + "    email TEXT,"
//                        + "    password TEXT"
//                        + ")";
//                stmt.execute(createUserTableSql);
//
//                // Create Post table
//                String createPostTableSql = "CREATE TABLE IF NOT EXISTS Post ("
//                        + "    id INTEGER PRIMARY KEY AUTOINCREMENT,"
//                        + "    userId INTEGER,"
//                        + "    title TEXT,"
//                        + "    content TEXT"
//                        + ")";
//                stmt.execute(createPostTableSql);
//
//                // Create Comment table
//                String createCommentTableSql = "CREATE TABLE IF NOT EXISTS Comment ("
//                        + "    id INTEGER PRIMARY KEY AUTOINCREMENT,"
//                        + "    postId INTEGER,"
//                        + "    userId INTEGER,"
//                        + "    comment TEXT"
//                        + ")";
//                stmt.execute(createCommentTableSql);
//
//                // Create Like table
//                String createLikeTableSql = "CREATE TABLE IF NOT EXISTS Liked ("
//                        + "    id INTEGER PRIMARY KEY AUTOINCREMENT,"
//                        + "    postId INTEGER,"
//                        + "    userId INTEGER"
//                        + ")";
//                stmt.execute(createLikeTableSql);
                // Create User table
                
//                                 Drop Like table
//                String dropCategoryTableSql = "DROP TABLE IF EXISTS Category";
//                stmt.execute(dropCategoryTableSql);
////
////                // Drop Like table
//                String dropLikeTableSql = "DROP TABLE IF EXISTS Liked";
//                stmt.execute(dropLikeTableSql);
////
////                // Drop Comment table
//                String dropCommentTableSql = "DROP TABLE IF EXISTS Comment";
//                stmt.execute(dropCommentTableSql);
//
//                // Drop Post table
//                String dropPostTableSql = "DROP TABLE IF EXISTS Post";
//                stmt.execute(dropPostTableSql);
//
//                // Drop User table
//                String dropUserTableSql = "DROP TABLE IF EXISTS User";
//                stmt.execute(dropUserTableSql);
//
//                                // Create Category table
//                String createCategoryTableSql = "CREATE TABLE IF NOT EXISTS Category ("
//                        + "    id INT AUTO_INCREMENT PRIMARY KEY,"
//                        + "    title VARCHAR(255),"
//                        + "    description TEXT"
//                        + ")";
//
//                stmt.execute(createCategoryTableSql);
//
//
//                // Insert data into Category table
//                String insertJavaSql = "INSERT INTO Category (title, description) VALUES ('Java', 'Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.')";
//                stmt.execute(insertJavaSql);
//
//                String insertPythonSql = "INSERT INTO Category (title, description) VALUES ('Python', 'Python is an interpreted, high-level and general-purpose programming language. Python''s design philosophy emphasizes code readability with its notable use of significant whitespace.')";
//                stmt.execute(insertPythonSql);
//
//                String insertPhpSql = "INSERT INTO Category (title, description) VALUES ('PHP', 'PHP is a server-side scripting language designed primarily for web development but also used as a general-purpose programming language.')";
//                stmt.execute(insertPhpSql);
//
//                String insertAndroidSql = "INSERT INTO Category (title, description) VALUES ('Android', 'Android is a mobile operating system based on a modified version of the Linux kernel and other open-source software. It is designed primarily for touchscreen mobile devices such as smartphones and tablets.')";
//                stmt.execute(insertAndroidSql);
//
//                String insertCppSql = "INSERT INTO Category (title, description) VALUES ('C++', 'C++ is a general-purpose programming language created as an extension of the C programming language, or \"C with Classes\". It was designed with a bias toward system programming and embedded, resource-constrained software and large systems, with performance, efficiency, and flexibility of use as its design requirements.')";
//                stmt.execute(insertCppSql);
//
//                String insertJavaScriptSql = "INSERT INTO Category (title, description) VALUES ('JavaScript', 'JavaScript is a high-level, interpreted programming language that conforms to the ECMAScript specification. It is widely used for client-side web development.')";
//                stmt.execute(insertJavaScriptSql);
//
//                String insertRubySql = "INSERT INTO Category (title, description) VALUES ('Ruby', 'Ruby is a dynamic, object-oriented programming language. It is known for its simplicity and productivity, with an elegant syntax that is easy to read and write.')";
//                stmt.execute(insertRubySql);
//
//                String insertSwiftSql = "INSERT INTO Category (title, description) VALUES ('Swift', 'Swift is a powerful and intuitive programming language developed by Apple for iOS, macOS, watchOS, tvOS, and beyond. It is designed to be fast, safe, and expressive.')";
//                stmt.execute(insertSwiftSql);
//
//                String insertGoSql = "INSERT INTO Category (title, description) VALUES ('Go', 'Go, also known as Golang, is a statically typed, compiled programming language designed at Google. It combines the ease of use and readability of interpreted languages like Python with the efficiency and performance of compiled languages like C or C++.')";
//                stmt.execute(insertGoSql);
//
//                String insertRustSql = "INSERT INTO Category (title, description) VALUES ('Rust', 'Rust is a multi-paradigm programming language designed for performance and safety. It aims to provide low-level control without sacrificing high-level language features, making it suitable for systems programming, game development, and more.')";
//                stmt.execute(insertRustSql);
//                
//                String createUserTableSql = "CREATE TABLE IF NOT EXISTS User ("
//                        + "    id INT AUTO_INCREMENT PRIMARY KEY,"
//                        + "    name VARCHAR(255),"
//                        + "    email VARCHAR(255) UNIQUE,"
//                        +"     gender VARCHAR(20),"
//                        +"     about VARCHAR(255),"
//                        +"     rdate TIMESTAMP,"
//                        +"     profile VARCHAR(255),"
//                        + "    password VARCHAR(255)"
//                        + ")";
//                stmt.execute(createUserTableSql);
//
//                // Create Post table
//                String createPostTableSql = "CREATE TABLE IF NOT EXISTS Post ("
//                        + "    id INT AUTO_INCREMENT PRIMARY KEY,"
//                        + "    userId INT,"
//                        + "    title VARCHAR(255),"
//                        + "    content TEXT,"
//                        + "    code TEXT,"
//                        + "    image VARCHAR(255),"
//                        +"     categoryId INT,"
//                        +"     cretedAt TIMESTAMP,"
//                        + "    FOREIGN KEY (userId) REFERENCES User(id)"
//                        + ")";
//                stmt.execute(createPostTableSql);
//
//                // Create Comment table
//                String createCommentTableSql = "CREATE TABLE IF NOT EXISTS Comment ("
//                        + "    id INT AUTO_INCREMENT PRIMARY KEY,"
//                        + "    pId INT,"
//                        + "    uId INT,"
//                        + "    comment TEXT,"
//                        + "    createdAt TEXT,"
//                        + "    FOREIGN KEY (pId) REFERENCES Post(id),"
//                        + "    FOREIGN KEY (uId) REFERENCES User(id)"
//                        + ")";
//                stmt.execute(createCommentTableSql);
//
//                // Create Like table
//                String createLikeTableSql = "CREATE TABLE IF NOT EXISTS Liked ("
//                        + "    id INT AUTO_INCREMENT PRIMARY KEY,"
//                        + "    pId INT,"
//                        + "    uId INT,"
//                        + "    FOREIGN KEY (pId) REFERENCES Post(id),"
//                        + "    FOREIGN KEY (uId) REFERENCES User(id)"
//                        + ")";
//                stmt.execute(createLikeTableSql);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
