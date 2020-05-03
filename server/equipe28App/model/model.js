//var mysql = require('mysql');
var guid = require('../lib/guid');

const fieldsNotUpdated = ["uid", "lastupdate_date", "lastupdate_uid_user", "create_date"]

module.exports = class Model {

    constructor(tableName, connection) {
        this.tableName = tableName;
        this.model = require('./' + tableName);
        this.connection = connection

    }

    GetFields = () => {
        var fieldList = []

        for (var i in this.model.rows) {
            var field = this.model.rows[i]
            fieldList.push(field.Field)
        }

        console.log(fieldList)
        return fieldList
    }    

    GetFieldsToUpdate = () => {
        var fieldList = []

        for (var i in this.model.rows) {
            var field = this.model.rows[i]

            if (!fieldsNotUpdated.find(f => f == field.Field)) {
                fieldList.push(field.Field)
            }
        }

        console.log(fieldList)
        return fieldList
    }

    CreateInsert = function (newRow) {
        console.log("CreateInsert 1")
        var fields = ["uid"]
        var values = [guid.GUID()]
        var fieldsToUpdate = this.GetFieldsToUpdate()

        for (var fieldName in newRow) {
            if (fieldsToUpdate.find(f => f == fieldName)) {
                fields.push(fieldName)
                values.push(newRow[fieldName])
            }
        }

        //console.log(fields, values)
        return { "fields": fields, "values": values }
    }

    CreateUpdate = function (newRow) {
        console.log("CreateUpdate 1")
        var fields = ["uid"]
        var values = [guid.GUID()]
        var fieldsToUpdate = this.GetFieldsToUpdate()

        var sqlUpdate = ""
        for (var fieldName in newRow) {
            if (fieldsToUpdate.find(f => f == fieldName)) {
                if (sqlUpdate != "")
                    sqlUpdate += ","
                sqlUpdate += `${fieldName}='${newRow[fieldName]}'`

                fields.push(fieldName)
                values.push(newRow[fieldName])
            }
        }

        console.log(fields, values, sqlUpdate)
        return { "fields": fields, "values": values, "text": sqlUpdate }
    }

    CreateFilter = function (filterList) {
        console.log("CreateFilter 1")

        var fields = this.GetFields()

        var sqlFilter = ""
        for (var fieldName in filterList) {
            if (fields.find(f => f == fieldName)) {
                if (sqlFilter != "")
                    sqlFilter += " and "

                sqlFilter += `${fieldName}='${filterList[fieldName]}'`
            }
        }

        console.log(sqlFilter)
        return { "text": sqlFilter }
    }


    dbGetList = (filterList) => {
        var self = this

        console.log("dbGetList entrando")

        return new Promise((resolve, reject) => {

            var sqlCommand = `select * from ${self.tableName}`
            if (filterList!=undefined) {
               var filter = self.CreateFilter(filterList)
               sqlCommand += ` where ${filter.text}`
            }

            
           // self.connection.connect();

            console.log(sqlCommand)

            self.connection.query(sqlCommand, function (error, results) {
                //self.connection.end();
                if (error) reject(error);

                console.log("dbGetList passou")
                    resolve(results)
                

            });
            

        })
    }

    dbInsert = (newRow) => {
        var self = this

        console.log("dbInsert entrando")

        return new Promise((resolve, reject) => {

            var insert = self.CreateInsert(newRow)

            //self.connection.connect();

            self.connection.query(`insert into ${self.tableName} (${insert.fields}) values (?)`, [insert.values], function (error) {
                if (error) reject(error);

                console.log("dbInsert salvou")

                //self.connection.end();

                resolve(insert)
            });

        })
    }

    dbUpdate = (uid, updRow) => {
        var self = this

        console.log("dbUpdate entrando")

        return new Promise((resolve, reject) => {

            var update = self.CreateUpdate(updRow)

            //self.connection.connect();

            console.log("dbUpdate sql", `update ${self.tableName} set ${update.sqlUpdate} where uid='${uid}'`)

            self.connection.query(`update ${self.tableName} set ${update.text} where uid='${uid}'`, function (error) {
                if (error) reject(error);

                console.log("dbUpdate salvou")

                //self.connection.end();

                resolve(update)
            });

        })
    }

    dbDelete = (uid) => {
        var self = this

        console.log("dbDelete entrando")

        return new Promise((resolve, reject) => {

            //self.connection.connect();
            self.connection.query(`delete from ${self.tableName} where uid='${uid}'`, function (error) {
                if (error) reject(error);

                console.log("dbDelete deletou")

               // self.connection.end();

                resolve("dbDelete deletou")
            });

        })
    }

}