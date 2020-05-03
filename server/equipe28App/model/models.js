exports.UserFields = () => ["name", "nickname", "url_avatar"]


exports.GetFieldsToUpdate = (tableName) => {
    var model = require('./'+tableName);

    var fieldList = []
    for (i in model.rows)
    {
        var field = model.rows[i]
        console.log(field)
        fieldList.push(field.Field)
    }

    console.log(fieldList)

    return fieldList

}

